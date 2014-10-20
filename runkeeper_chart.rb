require 'liquid'
require_relative 'runkeeper_helper'

def get_data(filename) # TODO should be in runkeeper helper?
  file = File.open(filename, "r")
  file_string = file.read 
  data = CSV.parse(file_string, {:headers=> true})  
end

def write_weather_graph_csv
  data = get_data("/Users/rebeccag/stuff/run_weather.csv")

  @categories = data['date'].to_s
  @pace = data['ave_pace'].map {|x| x.to_f}.to_s
  @temperature = data['temperature'].map {|x| x.to_f}.to_s
  @combined = data['combined'].map {|x| x.to_f}.to_s

    template = <<-PLAIN_TEXT
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
      <script src="http://code.highcharts.com/highcharts.js"></script>
      <script>
      $(function () {
          $('#container').highcharts({
              chart: {
                  zoomType: 'xy'
              },
              title: {
                  text: 'My Runs'
              },
              subtitle: {
                  text: 'of awesomeness'
              },
              xAxis: [{
                  categories: {{categories}}
              }],
              yAxis: [{ // Primary yAxis
                  labels: {
                      format: '{value} min/mi',
                      style: {
                          color: Highcharts.getOptions().colors[2]
                      }
                  },
                  title: {
                      text: 'Pace',
                      style: {
                          color: Highcharts.getOptions().colors[2]
                      }
                  },
                  opposite: true

              }, { // Secondary yAxis
                  gridLineWidth: 0,
                  title: {
                      text: 'Temperature',
                      style: {
                          color: Highcharts.getOptions().colors[0]
                      }
                  },
                  labels: {
                      format: '{value} deg F',
                      style: {
                          color: Highcharts.getOptions().colors[0]
                      }
                  }

              }, { // Tertiary yAxis
                  gridLineWidth: 0,
                  title: {
                      text: 'Combined',
                      style: {
                          color: Highcharts.getOptions().colors[1]
                      }
                  },
                  labels: {
                      format: '{value}',
                      style: {
                          color: Highcharts.getOptions().colors[1]
                      }
                  },
                  opposite: true
              }],
              tooltip: {
                  shared: true
              },
              legend: {
                  layout: 'vertical',
                  align: 'left',
                  x: 120,
                  verticalAlign: 'top',
                  y: 80,
                  floating: true,
                  backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
              },
              series: [{
                  name: 'Pace (smoothed)',
                  type: 'spline',
                  yAxis: 1,
                  data: {{pace}},
                  tooltip: {
                      valueSuffix: ' min/mi'
                  }

              }, {
                  name: 'Temperature',
                  type: 'spline',
                  yAxis: 2,
                  data: {{temperature}},
                  marker: {
                      enabled: false
                  },
                  dashStyle: 'shortdot',
                  tooltip: {
                      valueSuffix: ' deg F'
                  }

              }, {
                  name: 'Combined Temp & Humidity (smoothed)',
                  type: 'spline',
                  data: {{combined}},
                  tooltip: {
                      valueSuffix: ''
                  }
              }]
          });
      });
      </script>

      <div id="container"></div>
  PLAIN_TEXT


  @template = Liquid::Template.parse(template)  # Parses and compiles the template

  filestring = @template.render( "categories" => @categories, "pace" => @pace, "temperature" => @temperature, 'combined' => @combined)
  filename = "weather.html"
  puts "Writing #{filename}"

  File.open(filename, "w") do |f|
    f.write(filestring)
    f.close
  end 
end



