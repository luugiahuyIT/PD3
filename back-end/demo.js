const { MongoClient } = require('mongodb');

async function main() {
    const uri = "mongodb+srv://linh:dovanlinh1999@cluster0.f08py.mongodb.net/?retryWrites=true&w=majority";
    const client = new MongoClient(uri)

    try {
        await client.connect()
        await lisDatabase(client)

        await createListing(client, {
            name: "Admin",
            summary: "Being a simple person",
            bedroom: 1,
            bathrooms: 1,
        })
    } catch (e) {
        console.error(e)
    } finally {
        await client.close()
    }
}

main().catch(console.error)

async function createListing(client, newListing) {
    client.db("sample_airbnb").collection("ListingAndReviews").insertOne(newListing);

    console.log(`New listing created with the following id: ${result.insertedID}`)
}

async function lisDatabase(client) {
    const databaseList = await client.db().admin().lisDatabase()

    console.log("Database: ")
    databaseList.database.forEach(db => {
        console.log(`- ${db.name}`)
    })
}