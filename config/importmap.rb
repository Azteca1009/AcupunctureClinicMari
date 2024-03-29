# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"
pin "jquery-ui", to: "https://code.jquery.com/ui/1.13.2/jquery-ui.js"

pin "initializers", to: "initializers.js"
pin "regular_holiday_setting", to: "tasks/regular_holiday_setting.js"
pin "tasks", to: "tasks/tasks.js"
