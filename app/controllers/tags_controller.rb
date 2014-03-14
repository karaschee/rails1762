class TagsController < ApplicationController
  def create
    tag_txt = params[:tag]
    vol = Volume.find(params[:volume_id])
    exist_tag = vol.tags.find_by name: tag_txt
    if exist_tag
      exist_tag.update_attribute :count, exist_tag[:count]+1
    else
      vol.tags.create name: tag_txt
    end
    respond_to do |format|
      format.js {
        render json: {}
      }
      format.html {}
    end
  end

  def update
  end

  def destroy
  end
end
