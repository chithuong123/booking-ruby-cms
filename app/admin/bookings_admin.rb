Trestle.resource(:bookings) do
  menu do
    group :content, priority: :first do
      item :bookings, icon: "fas fa-building"
    end
  end

  table do
    column :service do |booking|
      booking.service.name
    end
    column :booking_date
    column :total_price, align: :right, format: :currency
    actions
  end
end
