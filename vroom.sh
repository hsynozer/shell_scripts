cd /root
apt install libssl-dev libasio-dev libglpk-dev git make cmake npm -y
git clone https://github.com/VROOM-Project/vroom.git
cd /root/vroom/src/
git checkout v1.14.0
git submodule init
git submodule update
make
cd /root/vroom

# Vroom Express
cd /root/
git clone https://github.com/VROOM-Project/vroom-express.git
cd /root/vroom-express
git checkout v0.12.0
npm install

echo "cliArgs:
  geometry: false # retrieve geometry (-g)
  planmode: false # run vroom in plan mode (-c) if set to true
  threads: 4 # number of threads to use (-t)
  explore: 5 # exploration level to use (0..5) (-x)
  limit: '1mb' # max request size
  logdir: '/..' # the path for the logs relative to ./src
  logsize: '100M' # max log file size for rotation
  maxlocations: 10000 # max number of jobs/shipments locations
  maxvehicles: 200 # max number of vehicles
  override: true # allow cli options override (-c, -g, -t and -x)
  path: '/root/vroom/bin/' # VROOM path (if not in $PATH)
  port: 3000 # expressjs port
  router: 'osrm' # routing backend (osrm, libosrm or ors)
  timeout: 300000 # milli-seconds
  baseurl: '/' #base url for api
routingServers:
  osrm:
    car:
      host: '0.0.0.0'
      port: '5000'
    bike:
      host: '0.0.0.0'
      port: '5001'
    foot:
      host: '0.0.0.0'
      port: '5002'
  ors:
    driving-car:
      host: '0.0.0.0/ors/v2'
      port: '8080'
    driving-hgv:
      host: '0.0.0.0/ors/v2'
      port: '8080'
    cycling-regular:
      host: '0.0.0.0/ors/v2'
      port: '8080'
    cycling-mountain:
      host: '0.0.0.0/ors/v2'
      port: '8080'
    cycling-road:
      host: '0.0.0.0/ors/v2'
      port: '8080'
    cycling-electric:
      host: '0.0.0.0/ors/v2'
      port: '8080'
    foot-walking:
      host: '0.0.0.0/ors/v2'
      port: '8080'
    foot-hiking:
      host: '0.0.0.0/ors/v2'
      port: '8080'
  valhalla:
    auto:
      host: '0.0.0.0'
      port: '8002'
    bicycle:
      host: '0.0.0.0'
      port: '8002'
    pedestrian:
      host: '0.0.0.0'
      port: '8002'
    motorcycle:
      host: '0.0.0.0'
      port: '8002'
    motor_scooter:
      host: '0.0.0.0'
      port: '8002'
    taxi:
      host: '0.0.0.0'
      port: '8002'
    hov:
      host: '0.0.0.0'
      port: '8002'
    truck:
      host: '0.0.0.0'
      port: '8002'
    bus:
      host: '0.0.0.0'
      port: '8002'" > /root/vroom-express/config.yml
