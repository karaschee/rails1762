class TagsController < ApplicationController
  def create
    tag_txt = params[:tag]
    vol = Volume.find(params[:volume_id])
    # exist_tag = Tag.find_by name: tag_txt, tagable_id: vol.id, tagable_type: vol.class.to_s
    exist_tag = vol.tags.find_by name: tag_txt
    if exist_tag
      exist_tag.update_attribute :count, exist_tag[:count]+1
    else
      vol.tags.create name: tag_txt
    end
    cookies.permanent.signed[:remember_me] = [current_user.id, current_user.salt]
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
