require './config/environment'

use Rack::MethodOverride
use UserController
use GameController
run ApplicationController