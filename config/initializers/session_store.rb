# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_laruby.com_session',
  :secret      => '42bd898cdb8e2b87e2a391e19ceb87b9fe3348925a09fa3f053b5aa03d5cf28c042ed0041f0fa4c7792aa9cf40c23bc1e5a99625e07a667677a1d058e8bc85a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
