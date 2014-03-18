class TagsController < ApplicationController
  def create
    tag_txt = params[:tag]
    belongto_id = params[:belongto_id]
    belongto_type = params[:belongto_type]
    exist_tag = Tag.find_by name: tag_txt, tagable_id: belongto_id, tagable_type: belongto_type

    if exist_tag
      exist_tag.update_attribute :count, exist_tag[:count]+1
    else
      Tag.create name: tag_txt, tagable_id: belongto_id, tagable_type: belongto_type
    end
    
    respond_to do |format|
      format.js {
        render json: {}
      }
      format.html {}
    end
  end

  def update
    tag = Tag.find(params[:id])
    tag.update_attribute :count, tag[:count]+1
    respond_to do |format|
      format.js {
        render json: {}
      }
      format.html {}
    end
  end

  def destroy
  end
end
