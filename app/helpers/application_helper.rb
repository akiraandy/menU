module ApplicationHelper

    def active_class(link_path)
        current_page?(link_path) ? "nav-link active" : "nav-link"
    end
    
    def days
        @days = (%w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday).to_a).to_a.zip(0..6)
    end

end
