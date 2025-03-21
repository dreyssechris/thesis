CASE 
    WHEN config_device_type = 0 THEN 'Desktop'
    WHEN config_device_type = 1 THEN 'Smartphone'
    WHEN config_device_type = 2 THEN 'Tablet'
    WHEN config_device_type = 5 THEN 'TV'
    ELSE 'Unknown'
END AS device,