module ItemHelper
    def button_status(item)
        !item.daily_special_status || item.DotW == Date.today.wday ? "btn btn-primary" : "btn btn-primary disabled"
    end

    def active_star(item)
        item.daily_special_status && item.DotW == Date.today.wday ? "color:rgb(231, 200, 21)" : "color:#eee"
    end

    def checkout(order)
        order.order_items.empty? ? "btn btn-success btn-block disabled" : "btn btn-success btn-block"
    end
end