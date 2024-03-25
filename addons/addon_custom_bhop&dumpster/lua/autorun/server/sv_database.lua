require( "mysqloo" )

ncba_custom_db = mysqloo.connect( ncba_custom.mysql.host, ncba_custom.mysql.user, ncba_custom.mysql.password, ncba_custom.mysql.table, ncba_custom.mysql.port )

function ncba_custom_db:onConnected()
    print( "[NCBA Custom Scripts by: Walrusking] DB connected" )
    local check_table = ncba_custom_db:query( "CREATE TABLE whitelist_bhop (player_name varchar(255), steamid varchar(255))" )
    check_table:start()
end

function ncba_custom_db:onConnectionFailed( err )
    print( "[NCBA Custom Scripts by: Walrusking] DB connection failed with Error: " .. err )
end

function ncba_custom_bhopcheckwl(steamid)
    local search_list = ncba_custom_db:query( "SELECT * FROM whitelist_bhop WHERE steamid='"..steamid.."'" )
    search_list:start()
    function search_list:onSuccess( data )
        local steamid_found = false
        if search_list then
            for k, v in pairs( data ) do
                if v["steamid"] == steamid then
                    steamid_found = true
                else
                    steamid_found = false
                end
            end
        end
        if steamid_found then
            player.GetBySteamID(steamid):SetNWBool("ncba_custom_bhop_whitelisted",true)
            return
        else
            player.GetBySteamID(steamid):SetNWBool("ncba_custom_bhop_whitelisted",false)
            return
        end
    end
    function search_list:onError( err, sql )
        player.GetBySteamID(steamid):SetNWBool("ncba_custom_bhop_whitelisted",false)
    end
end

function ncba_custom_updatename(steamid)
    local insert = ncba_custom_db:query( "UPDATE whitelist_bhop SET player_name='" .. player.GetBySteamID(steamid):Nick() .. "'WHERE steamid='" ..steamid.. "'" )
    insert:start()
end

function ncba_custom_bhopgrantwl(steamid)
    local search_list = ncba_custom_db:query( "SELECT * FROM whitelist_bhop" )
    search_list:start()
    function search_list:onSuccess( data )
        local steamid_found = false
        if search_list then
            for k, v in pairs( data ) do
                if v["steamid"] == steamid then
                    steamid_found = true
                else
                    steamid_found = false
                end
            end
        end
        if !steamid_found then
            local insert = ncba_custom_db:query( "INSERT INTO whitelist_bhop (player_name, steamid) VALUES ('" .. "Unknown" .. "','" .. steamid .. "')" )
            insert:start()
            print("[bHop] Whitelisted: "..steamid)
            for k, v in pairs( player.GetAll() ) do
                if v:SteamID() == steamid then
                    ncba_custom_bhopcheckwl(steamid)
                    v:PlayerMsg(Color(255,255,255),"[",Color(135,206,250),"bHop",Color(255,255,255),"]"," You have been whitelisted. You can use "..ncba_custom.bhop.command..", or type "..ncba_custom.bhop.cnslcmd.." into console | Thank you for your donation!")
                    ncba_custom_updatename(steamid)
                end
            end
            return
        else
            print("[bHop] SteamID is already whitelisted")
            return
        end
    end
end

function ncba_custom_bhoprevokewl(steamid)
    local search_list = ncba_custom_db:query( "SELECT * FROM whitelist_bhop WHERE steamid='"..steamid.."'" )
    search_list:start()
    function search_list:onSuccess( data )
        local steamid_found = false
        if search_list then
            for k, v in pairs( data ) do
                if v["steamid"] == steamid then
                    steamid_found = true
                else
                    steamid_found = false
                end
            end
        end
        if steamid_found then
            local delete = ncba_custom_db:query( "DELETE FROM whitelist_bhop WHERE steamid = '" .. steamid .. "'" )
            delete:start()
            print("[bHop] Revoked whististing: "..steamid)
            for k, v in pairs( player.GetAll() ) do
                if v:SteamID() == steamid then
                    ncba_custom_bhopcheckwl(steamid)
                    v:PlayerMsg(Color(255,255,255),"[",Color(135,206,250),"bHop",Color(255,255,255),"]"," Your whitelist has been revoked.")
                    if v:GetNWBool("ncba_custom_bhop_whitelisted") then
                        v:SetNWBool("ncba_custom_bhop_whitelisted",false)
                    end
                end
            end
            return
        else
            print("[bHop] SteamID is not whitelisted")
            return
        end
    end
end

ncba_custom_db:connect()