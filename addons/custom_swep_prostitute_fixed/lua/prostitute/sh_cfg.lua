--[[-------------------------------------------------------------------------
Theme Config
---------------------------------------------------------------------------]]
-- Main Panel
cl3ptute_cfg.bgcol = Color(25,25,25,150) -- Color of the main background
cl3ptute_cfg.bordercol = "rainbow" -- Color of the border (make it "rainbow" for rainbow borders, otherwise use a normal Color(r,g,b,a))
cl3ptute_cfg.offeringTxt = "You will offer your services to %name%" -- Text to display in the offering box (%name% will be replaced with the recipient's name)
cl3ptute_cfg.txtcol = Color(255,255,255) -- Color of the text listed above
-- Button
cl3ptute_cfg.btncol = Color(25,25,25,200) -- Color of the button to submit
cl3ptute_cfg.btntxt = "Send Offer" -- Text inside the button
cl3ptute_cfg.btntxtcol = Color(255,255,255) -- Color of the button text

--[[-------------------------------------------------------------------------
General Config
---------------------------------------------------------------------------]]
cl3ptute_cfg.allowedTeams = {"Prostitute"} -- Teams allowed to use the SWEP functionality *case sensitive* (to prevent exploiters)
cl3ptute_cfg.pimpJobs = {"Pimp"} -- Teams who are counted as a pimp (take a percentage of the prostitute's pay)
cl3ptute_cfg.pimpPercentage = 0.25 -- 0.25 = 25%, 0.5 = 50% etc... (what percentage of the pay the pimp will take)
cl3ptute_cfg.stdChance = 25 -- x / 100 chance that the client will obtain an std during sexy time
cl3ptute_cfg.maximumSell = 5000 -- Maximum price the person can offer themselves for
cl3ptute_cfg.minimumSell = 250 -- Minimum price the person can offer themselves for
cl3ptute_cfg.sexytime = 15 -- How many seconds the sexy time will last for