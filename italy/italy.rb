require 'csv'
require 'rails'
require_relative 'weather_utils'

# airports = CSV.read("../Downloads/airports.csv", headers: true)
# italy = airports.select {|x| x["iso_country"] == "IT"}
# large_airports = italy.select {|x| x["type"] == "large_airport"}

# 2.1.2 :090 >   airports.headers
#  => ["id", "ident", "type", "name", "latitude_deg", "longitude_deg", "elevation_ft", "continent", "iso_country", "iso_region", "municipality", "scheduled_service", "gps_code", "iata_code", "local_code", "home_link", "wikipedia_link", "keywords"]

@info = {
  venice: {
    airport_code: "LIPZ",
    start_date: Date.new(2015, 11, 1),
    end_date: Date.new(2015, 11, 4)
  },
  florence: {
    airport_code: "LIRQ",
    start_date: Date.new(2015, 11, 4),
    end_date: Date.new(2015, 11, 7)
  },
  rome: {
    airport_code: "LIRF",
    start_date: Date.new(2015, 11, 7),
    end_date: Date.new(2015, 11, 9)
  },
  naples: {
    airport_code: "LIRN",
    start_date: Date.new(2015, 11, 9),
    end_date: Date.new(2015, 11, 10)
  },
  salerno: {
    airport_code: "LIRI",
    start_date: Date.new(2015, 11, 9),
    end_date: Date.new(2015, 11, 10)
  }
}

@years = [2010, 2011, 2012, 2013, 2014, 2015]

@cities = [
  :venice,
  :florence,
  :rome,
  :naples,
  :salerno
]


def download_data
  puts "Downloading data"
  @cities.each do |city|
    city = @info[city]
    weather = WeatherUtils.new(city[:airport_code])
    start_date = city[:start_date]
    end_date = city[:end_date]

    @years.each do |year|
      start_date = start_date.change(year: year)
      end_date = end_date.change(year: year)

      weather.download_days_for_range(start_date, end_date)
      weather.download_file_for_year(year)
    end
  end
end

def calculate_averages
  @cities.each do |city|
    info = @info[city]
    airport = info[:airport_code]
    weather = WeatherUtils.new(airport)

  end
end


# download_data
calculate_averages





# 2.1.2 :045 >   large_airports.map {|x| x["municipality"]}
#  => ["Bari", "Catania", "Palermo", "Cagliari", "Milan", "Bergamo", "Torino", "Genova", "Milan", "Cuneo", "Bologna", "Treviso", "Verona", "Venice", "Roma", "Rome", "Nápoli", "Pisa"]

# 2.1.2 :052 >   large_airports.map {|x| x["ident"]}
#  => ["LIBD", "LICC", "LICJ", "LIEE", "LIMC", "LIME", "LIMF", "LIMJ", "LIML", "LIMZ", "LIPE", "LIPH", "LIPX", "LIPZ", "LIRA", "LIRF", "LIRN", "LIRP"]

# 2.1.2 :085 > large_airports.map {|x| puts "#{x['ident']} #{x['municipality'].ljust(9)} #{x['latitude_deg'].ljust(20)} #{x['longitude_deg']}"}
# LIBD Bari      41.1389007568        16.7605991364
# LICC Catania   37.466800689699994   15.0663995743
# LICJ Palermo   38.1759986877        13.0909996033
# LIEE Cagliari  39.251499176         9.05428028107
# LIMC Milan     45.6305999756        8.728110313419998
# LIME Bergamo   45.6739006042        9.70417022705
# LIMF Torino    45.2008018494        7.64963006973
# LIMJ Genova    44.41329956049999    8.83749961853
# LIML Milan     45.445098877         9.27674007416
# LIMZ Cuneo     44.547000885         7.623219966890001
# LIPE Bologna   44.535400390599996   11.2887001038
# LIPH Treviso   45.648399353         12.1943998337
# LIPX Verona    45.3956985474        10.8885002136
# LIPZ Venice    45.5052986145        12.3519001007
# LIRA Roma      41.7994003296        12.5949001312
# LIRF Rome      41.8045005798        12.2508001328
# LIRN Nápoli    40.8860015869        14.290800094600002
# LIRP Pisa      43.683898925799994   10.3927001953


# 2.1.2 :028 > large_airports = italy.select {|x| x["type"] == "large_airport" || x["type"] == "medium_airport"}
# 2.1.2 :027 >   large_airports.map {|x| puts "#{x['ident']} #{x['municipality'].try(:ljust, 9)} #{x['latitude_deg'].try(:ljust, 20)} #{x['longitude_deg']}"}
# LIBA Foggia    41.54140090942383    15.718099594116211
# LIBC Crotone   38.99720001220703    17.0802001953125
# LIBD Bari      41.1389007568        16.7605991364
# LIBF Foggia    41.4328994751        15.534999847400002
# LIBG Grottaglie 40.5175018311        17.4032001495
# LIBN  40.239200592         18.1333007812
# LIBP Pescara   42.43170166015625    14.181099891662598
# LIBR Brindisi  40.6576004028        17.9470005035
# LIBV Gioia Del Colle 40.767799377399996   16.9333000183
# LICA Lamezia Terme 38.905399322509766   16.242300033569336
# LICB Comiso    36.9946010208        14.6071815491
# LICC Catania   37.466800689699994   15.0663995743
# LICD Lampedusa 35.49789810180664    12.6181001663208
# LICG Pantelleria 36.81650161743164    11.968899726867676
# LICJ Palermo   38.1759986877        13.0909996033
# LICP Palermo   38.110801696799996   13.3133001328
# LICR Reggio Calabria 38.07120132446289    15.651599884033203
# LICT Trapani   37.911399841299996   12.4879999161
# LICZ  37.40169906616211    14.92240047454834
# LIDM Mantova   45.135833740234375   10.79444408416748
# LIDR Ravenna   44.36429977416992    12.224900245666504
# LIDT Trento    46.021400451699996   11.1241998672
# LIEA Alghero   40.6320991516        8.29076957703
# LIED Decimomannu 39.35419845581055    8.972479820251465
# LIEE Cagliari  39.251499176         9.05428028107
# LIEO Olbia     40.8987007141        9.51762962341
# LIET Arbatax   39.918800354         9.68297958374
# LILA Alessandria 44.925201416         8.62512969971
# LILE Biella    45.495300293         8.102780342099999
# LILI Vercelli  45.3111991882        8.41742038727
# LILM Casale Monferrato 45.1111984253        8.456029891970001
# LILN Varese    45.7421989441        8.88823032379
# LIMA Torino    45.0863990784        7.60337018967
# LIMC Milan     45.6305999756        8.728110313419998
# LIME Bergamo   45.6739006042        9.70417022705
# LIMF Torino    45.2008018494        7.64963006973
# LIMG Albenga   44.0505981445        8.12742996216
# LIMJ Genova    44.41329956049999    8.83749961853
# LIML Milan     45.445098877         9.27674007416
# LIMN Cameri (NO) 45.5295982361        8.6692199707
# LIMP Parma     44.824501037597656   10.29640007019043
# LIMR Novi Ligure 44.779998779299994   8.78639030457
# LIMS Piacenza  44.913101            9.723323
# LIMW Aosta     45.7384986877        7.36872005463
# LIMZ Cuneo     44.547000885         7.623219966890001
# LIPA Aviano    46.031898498535156   12.596500396728516
# LIPB Bolzano   46.460201263427734   11.326399803161621
# LIPC Cervia    44.2242012024        12.3072004318
# LIPE Bologna   44.535400390599996   11.2887001038
# LIPH Treviso   45.648399353         12.1943998337
# LIPI Codroipo  45.97869873046875    13.049300193786621
# LIPK Forlì     44.1948013306        12.070099830600002
# LIPL Ghedi     45.43220139          10.2677002
# LIPO Montichiari 45.428901672399995   10.3305997849
# LIPQ Trieste   45.8274993896        13.4722003937
# LIPR Rimini    44.0203018188        12.611700058
# LIPS Istrana   45.684898376464844   12.082900047302246
# LIPT Vicenza   45.57339859008789    11.529500007629395
# LIPU Padova    45.39580154418945    11.847900390625
# LIPX Verona    45.3956985474        10.8885002136
# LIPY Ancona    43.6162986755        13.3622999191
# LIPZ Venice    45.5052986145        12.3519001007
# LIQS Siena     43.25630187989999    11.255000114399998
# LIQW Sarzana   44.0880012512        9.987950325009999
# LIRA Roma      41.7994003296        12.5949001312
# LIRE Pomezia   41.65449905395508    12.445199966430664
# LIRF Rome      41.8045005798        12.2508001328
# LIRG Guidonia  41.990299224853516   12.740799903869629
# LIRI Salerno   40.6203994751        14.9112997055
# LIRJ Marina  Di Campo 42.76029968261719    10.239399909973145
# LIRL Latina    41.54240036010742    12.909000396728516
# LIRM Caserta   41.06079864501953    14.081899642944336
# LIRN Nápoli    40.8860015869        14.290800094600002
# LIRP Pisa      43.683898925799994   10.3927001953
# LIRQ Firenze   43.8100013733        11.205100059500001
# LIRS Grosetto  42.759700775146484   11.071900367736816
# LIRU Roma      41.951900482177734   12.498900413513184
# LIRV Viterbo   42.430198669433594   12.064200401306152
# LIRZ Perugia   43.0959014893        12.513199806200001

