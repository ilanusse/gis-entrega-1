require 'csv'    

csv_text = File.read('companies.csv')
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  name = row[1]
  origin = row[2]
  sector = row[3]
  status = row[4]
  address1 = row[5]
  address2 = row[6]
  g_latitude = row[20]
  g_longitude = row[21]
  
  # Generate command
  command = "psql -d gis-entrega-1 -c \"INSERT INTO companies (name, origin, sector, status, address, address2, geometry)
                                    VALUES ('#{name}', '#{origin}', '#{sector}', '#{status}', '#{address1}', '#{address2}', ST_GeomFromText('POINT(#{g_longitude} #{g_latitude} 0)', 4326));\""
  puts command
  puts "#{g_longitude}, #{g_latitude}"

  # Create entry in database
  system(command)
end