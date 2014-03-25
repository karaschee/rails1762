class TagsController < ApplicationController
  def create
    belongto_id = params[:belongto_id]
    belongto_type = params[:belongto_type]
    is_auth = validate_auth belongto_type+belongto_id

    if is_auth
      tag_txt = params[:tag]
      exist_tag = Tag.find_by name: tag_txt, tagable_id: belongto_id, tagable_type: belongto_type
      if exist_tag
        exist_tag.update_attribute :count, exist_tag[:count]+1
      else
        Tag.create name: tag_txt, tagable_id: belongto_id, tagable_type: belongto_type
      end
    end

    respond_to do |format|
      format.js {
        render json: { stat: is_auth ? 1 : 0 }
      }
      format.html {}
    end
  end

  def update
    tag = Tag.find(params[:id])
    is_auth = validate_auth tag.tagable_type+tag.tagable_id.to_s
    tag.update_attribute :count, tag[:count]+1 if is_auth
    respond_to do |format|
      format.js {
        render json: { stat: is_auth ? 1 : 0 }
      }
      format.html {}
    end
  end

  def destroy
  end

  private

    def validate_auth(existed)
      counted = cookies[:counted]
      unless counted.present?
        cookies[:counted] = { :value => "", :expires => 1.day.from_now }
        counted = []
      else
        begin
          counted = ActiveSupport::JSON.decode(counted)
        rescue
          cookies[:counted] = { :value => "", :expires => 1.day.from_now }
          counted = []
        end
      end
      if counted.include? existed
        return false
      else
        cookies[:counted] = { :value => ActiveSupport::JSON.encode(counted.push(existed)), :expires => 1.day.from_now }
        return true
      end
    end
end
