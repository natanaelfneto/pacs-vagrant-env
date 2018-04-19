echo "changing database password...";
psql -d template1 -c "ALTER USER postgres WITH PASSWORD 'pgadminpacs';";
createdb pacsdb;
psql pacsdb -f /vagrant/pacs/dcm3chee-2.18.1-psql/sql/create.psql;
echo "existing postgres user...";
exit;