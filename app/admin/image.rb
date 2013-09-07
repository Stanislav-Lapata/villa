ActiveAdmin.register Image do
  index do
    column :image
    default_actions
  end

  controller do
    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      flash[:alert] = "Image was successfully deleted"
      redirect_to edit_admin_villa_path(@image.villa)
    end

    def update_positions
      params[:positions].each do |id, index|
        Image.where(id: id).update_all(position: index)
      end
      render nothing: true
    end
  end
end
