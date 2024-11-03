Trestle.resource(:services, model: Service) do
  menu do
    group :content, priority: :first do
      item :services, icon: "fas fa-concierge-bell", unless: -> { current_user.superadmin? }
    end
  end


  # Set default scope to filter services belonging to current_user
  scope :all, default: true do |params|
    Service.where(agency_id: current_user.agency_id)
  end

  table do |service|
    column :name, link: true
    column :description
    column :price, align: :right, format: :currency
    column :agency, link: true
    column :images do |service|
      service.images.map do |img|
        image_tag img.url, style: "max-height: 50px; max-width: 50px;"
      end.join(" ").html_safe
    end
    actions
  end

  form do |service|
    text_field :name
    text_area :description
    number_field :price
    hidden_field :agency_id, value: current_user.agency_id
    file_field :images, multiple: true
  end
end
