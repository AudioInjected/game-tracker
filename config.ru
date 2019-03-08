require './config/environment'

use Rack::MethodOverride
use OwnerController
run ApplicationController