#continue
#read -r -d '' JSON <<- EJSON
cat << EJSON > /tmp/sji-bdl-createUser.js
db.createUser( {
	user: "${MONGO_INITDB_USERNAME:-sji-bdl}",
	pwd: "${MONGO_INITDB_PASSWORD:-sji-bdl}",
	roles: [ {
		role: "readWrite",
		db: "${MONGO_INITDB_DATABASE:-sji-bdl}"
	} ]
} )
EJSON

"${mongo[@]}" "$MONGO_INITDB_DATABASE" /tmp/sji-bdl-createUser.js
rm /tmp/sji-bdl-createUser.js
