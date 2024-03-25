ad2_wl = ad2_wl or {}

local wl = {
    "keypad",
    "button"
}

for _, v in ipair(wl) do
    ad2_wl[v] = true
end