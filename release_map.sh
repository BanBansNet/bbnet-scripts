#!/bin/bash
# ChillerDraon's map release script

function get_date {
  date "+%F %H:%M:%S"
}

if (( $# != 1 )); then
    echo "Usage: $0 <SQLPassword>"
    exit
fi

echo "Map will be released now: $(get_date)"
read -p "MapName: " MapName
read -p "ServerType: " SrvType
read -p "Points: " Points
read -p "Stars: " Stars
read -p "Mapper: " Mapper


echo "Is the input correct and do you really want to add that map? [y/n]"
read -n 1 -p "" inp
echo ""
if [ "$inp" == "Y" ]; then
    test
elif [ "$inp" == "y" ]; then
    test
else
    echo "Cancelled map release."
    exit
fi

read -d '' sql << EOF
    INSERT INTO \`record_maps\`
    (Map, Server, Mapper, Points, Stars, Timestamp)
    VALUES
    ('$MapName','$SrvType','$Mapper',$((Points)),$((Stars)),'$(get_date)'); 
EOF

echo "$sql" | mysql -u bbnet -p$1 bbnet
./list_maps.sh $1

