if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_api', domain: 'フロントエンドのドメイン'
else
    Rails.application.config.session_store :cookie_store, key: '_api'
end
