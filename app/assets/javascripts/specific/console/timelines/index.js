//= require underscore
//= require backbone
//= require tinytip

(function(){
  var requestTip = new $.Tinytip();

  Backbone.$(document).ajaxStart(function() {
    requestTip.show();
  });
  Backbone.$(document).ajaxStop(function() {
    requestTip.hide();
  });

  // Backbone initialize - Resource
  // ----------------------------------
  var Resource = Backbone.Model.extend({
    url: _DATA_.pathUpdateResource,
    defaults: {
      value: _DATA_.resourceVal,
      mode: '' // edit \ show
    },
    initialize: function(){
    },
    validate: function(attrs){
      if( !/https?:\/\/.*\.mp3/.test(attrs.value) ){
        return {
          status: 0,
          tip: '资源地址无效。'
        };
      }
    }
  });

  var ResourceView = Backbone.View.extend({
    timerInfo: false,
    el: '#j_resourceBox',
    template: _.template($('#j_resourceTemplate').html()),
    initialize: function(){
      var resource = new Resource();
      var that = this;

      resource.on('invalid', function(model, error){
        if(error.status === 0){
          that.showTip();
          $('#j_btnConfirmResource').button('reset');
        }
      })

      this.model = resource;
      
      this.listenTo(this.model, 'change:value', function(){
        that.model.save({}, {success:function(){
          that.showMode();
        }})
      });
      this.listenTo(this.model, 'change:mode', this.render);

      if(resource.get('value') === ''){ // edit
        this.editMode();
      }else { // show
        this.showMode();
      }
    },
    render: function(){
      this.$el.html( this.template(this.model.toJSON()) );
      this.player = $('#j_player');

      if(this.model.get('mode') === 'edit'){
        clearInterval(this.timerInfo);
        this.timerInfo = false;
      }else {
        this.refreshInfo();
      }
    },
    events: {
      'click button#j_btnConfirmResource': 'confirmEdit',
      'click button#j_btnEditResource': 'editMode',
      'click button#j_btnCancelResource': 'showMode',

      'click button#j_start': function(){
        this.player[0].play();
      },
      'click button#j_pause': function(){
        this.player[0].pause();
      },
      'click button#j_prev5': function(){
        this.player[0].currentTime -= 5;
      },
      'click button#j_prev30': function(){
        this.player[0].currentTime -= 30;
      },
      'click button#j_prev60': function(){
        this.player[0].currentTime -= 60;
      },
      'click button#j_prev600': function(){
        this.player[0].currentTime -= 600;
      },
      'click button#j_next5': function(){
        this.player[0].currentTime += 5;
      },
      'click button#j_next30': function(){
        this.player[0].currentTime += 30;
      },
      'click button#j_next60': function(){
        this.player[0].currentTime += 60;
      },
      'click button#j_next600': function(){
        this.player[0].currentTime += 600;
      }
    },
    confirmEdit: function(){
      var url = this.$el.find('input').val().trim();
      if(url === ''){
        this.model.trigger('invalid', this.model, this.model.validate({value:''}));
      }else if(this.model.get('value') === url){
        this.showMode();
      }else {
        $('#j_btnConfirmResource').button('loading');
        this.model.set({value: url});
        this.player = $('#j_player');
      }

    },
    editMode: function(){
      this.model.set({mode: 'edit'});
    },
    showMode: function(){
      this.model.set({mode: 'show'});
    },
    showTip: function(){
      $('#j_tip').modal('show');
    },
    refreshInfo: function(){
      var that = this;
      this.timerInfo = this.timerInfo || setInterval(function(){
        var player = that.player;

        if( !(player && player.length !== 0) ) return;

        var total = player.prop('duration');
        var current = player.prop('currentTime');

        if(isNaN(total)) return;

        $('#j_info_total').html(total);
        $('#j_info_current').html(current);
      }, 1000);
    }
  });

  var resourceView = new ResourceView();

  // Backbone initialize - Timeline
  // ----------------------------------
  var Timeline = Backbone.Model.extend({
    defaults: {
      volume_id: _DATA_.volId,
      card_id: 0,
      at_time: 0
    },
    initialize: function(){
    }
  });

  var Timelines = Backbone.Collection.extend({
    url: _DATA_.pathVolTimelines,
    model: Timeline,
    comparator: 'at_time'
  });

  var TimelineView = Backbone.View.extend({
    tagName: 'tr',
    template: _.template($('#j_timelineTemplate').html()),
    initialize: function(){
      this.listenTo(this.model, 'destroy', this.remove)
    },
    render: function(data){
      return this.$el.html( this.template(data) )
    },
    events: {
      'click .j_delTimeline': 'del'
    },
    del: function(){
      this.model.destroy();
    }
  });

  var TimelinesView = Backbone.View.extend({
    el: '#j_timelineList',
    initialize: function(){
      var timelines = new Timelines();
      var that = this;

      this.collection = timelines;

      this.listenTo(timelines, 'sync', this.syncEvent);
      timelines.fetch({success: function(){
        that.initRender();
      }});
    },
    events: {
      // 'click #j_addTimeline': 'createTimeline'
    },
    addTimeline: function(timeline){
      var i = timeline.collection.models.indexOf(timeline);
      var timelineView = new TimelineView({model: timeline});
      var toRender = timelineView.render(timeline.toJSON());

      if(i === 0){
        this.$el.prepend(toRender);
      }else {
        this.$el.children().eq(i-1).after(toRender);
      }
    },
    initRender: function(){
      this.collection.each(this.addTimeline, this);
    },
    syncEvent: function(model, resp, options){
      if(resp.status === 1){ // create a new Model
        this.addTimeline(model);
      }
    }
  });

  // Timeline javascripts
  // ----------------------------------
  var timelinesView = new TimelinesView();

  // Backbone initialize - Card
  // ----------------------------------
  var Card = Backbone.Model.extend({

  });

  var Cards = Backbone.Collection.extend({
    model: Card,
    url: _DATA_.pathCards
  });

  var CardView = Backbone.View.extend({
    tagName: 'tr',
    template: _.template($('#j_cardTemplate').html()),
    render: function(){
      return this.$el.html( this.template(this.model.toJSON()) );
    },
    events: {
      'click .j_addCard': 'createTimeline'
    },
    createTimeline: function(e){
      var player = ResourceView.palyer;

      if( isNaN(player.prop('duration')) ) return;

      timelinesView.collection.create({
        at_time: parseInt(player.prop('currentTime')),
        card_id: this.model.get('id'),
        card_title: this.model.get('title')
      });
    }
  });

  var CardsView = Backbone.View.extend({
    el: '#j_searchCard',
    events: {
      'keyup #j_inputSearch': 'search',
      'click #j_refreshCards': 'refresh'
    },
    initialize: function(){
      this.elemList = this.$el.find('table');
      this.refresh();
    },
    render: function(filter){
      var tmpBox = $('<div>');
      this.collection.each(function(card){
        var view = card.get('view');
        if(card.get('toFilter').indexOf(filter) !== -1){
          tmpBox.append(view.render());
        }
      });
      this.elemList.html( tmpBox.children().length === 0 ? '<tr><td>未搜索到结果</td></tr>' : tmpBox.children() );
    },
    initCardView: function(){
      this.collection.each(function(card){
        var cardView = new CardView({model: card});
        card.set({
          'view': cardView,
          'toFilter': card.get('id')+card.get('card_type_name')+card.get('title')+card.get('desc')
        });
      });
    },
    search: function(e){
      this.render( $(e.target).val() );
    },
    refresh: function(){
      var that = this,
          cards = new Cards();
          
      cards.fetch({success: function(collection, response, options){
        that.collection = collection;
        that.initCardView();
        that.render('');
      }});
    }
  });

  var cardsView = new CardsView();
})();
