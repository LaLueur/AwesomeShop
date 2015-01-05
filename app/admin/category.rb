ActiveAdmin.register Category do

  config.sort_order = 'position_asc'

  index do
    column :name do |this|
      link_to this.name, admin_category_path(this)
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Category' do
      f.input :name
    end
    f.actions
  end

  collection_action :sort, :method => :post do
    puts params.inspect
    params[:category].each_with_index do |id, index|
      Category.update(id ,position: index+1)
    end
    render :nothing => true
  end

  permit_params :name, :position, :id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
