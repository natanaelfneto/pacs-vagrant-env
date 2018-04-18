echo "changing database password..."
psql -d template1 -c "ALTER USER postgres WITH PASSWORD 'pgadminpacs';";
echo "existing postgres user..."