# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.3.2/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "stimulus-read-more", to: "https://ga.jspm.io/npm:stimulus-read-more@4.1.0/dist/stimulus-read-more.mjs"
pin "stimulus-checkbox-select-all", to: "https://ga.jspm.io/npm:stimulus-checkbox-select-all@5.2.0/dist/stimulus-checkbox-select-all.mjs"
