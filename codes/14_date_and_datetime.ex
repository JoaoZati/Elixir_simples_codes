Time.utc_now # ~T[19:39:31.056226]
~T[19:39:31.056226] # ~T[19:39:31.056226] # Note: sigils

# functions
t = ~T[19:39:31.056226]
t.hour
t.minute
t.day

# Date (dont have time but have Day, month and year)
Date.utc_today # ~D[2028-10-21]
day = ~D[2028-10-21]

{:ok, date} = Date.new(2020, 12, 12)
Date.day_of_week date
Date.leap_year? date

# NaiveDatetime, dont have timezone
NaiveDateTime.utc_now # ~N[2029-01-21 19:55:10.008965]
NaiveDateTime.add(~N[2018-10-01 00:00:14], 30) # ~N[2018-10-01 00:00:44]

# Datetime
DateTime.from_naive(~N[2016-05-24 13:26:08.003], "Etc/UTC")
# {:ok, #DateTime<2016-05-24 13:26:08.003Z>}

# First install
Tzdata.tzdata_version # see if its installed
config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase

paris_datetime = DateTime.from_naive!(~N[2019-01-01 12:00:00], "Europe/Paris")
{:ok, ny_datetime} = DateTime.shift_zone(paris_datetime, "America/New_York")