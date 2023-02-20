#continue
#read -r -d '' JSON <<- EJSON
cat << EJSON > /tmp/sji-bdl-createUser.js
db.createUser( {
	user: "${MONGO_USERNAME:-sji-bdl}",
	pwd: "${MONGO_PASSWORD:-sji-bdl}",
	roles: [ {
		role: "readWrite",
		db: "${MONGO_DB:-sji-bdl}"
	} ]
} )
EJSON

"${mongo[@]}" "$MONGO_DB" /tmp/sji-bdl-createUser.js
rm /tmp/sji-bdl-createUser.js
