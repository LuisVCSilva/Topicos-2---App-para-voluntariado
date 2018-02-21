module MetasHelper
    def run_logic_for_partial
       @metas = ActiveRecord::Base.connection.execute("SELECT * FROM thredded_messageboards")
    end
end
