module DatabaseRewinder
  class Railtie < ::Rails::Railtie
    initializer 'database_rewinder', after: 'active_record.initialize_database' do
      ActiveSupport.on_load :active_record do
        p [:database_rewinder, :railtie]
        DatabaseRewinder.init
        p [:database_rewinder, :railtie, :init]
        require_relative 'active_record_monkey'
        p [:database_rewinder, :railtie, :ok]
      end
    end
  end
end
