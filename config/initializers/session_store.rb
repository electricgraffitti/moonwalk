# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_moonwalk_session',
  :secret      => 'adbe6837a208e0965aed12aca444c1c85154e46efe8c78334a8646bb3766d86494cec7ddf0c90e6b556957c594904528d2713267bf46a9e385e60421af4e87a6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
