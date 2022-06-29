package db;

import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.eq;

public class DbConnection {

	private MongoClient mongoClient;
	private MongoDatabase database;
	private MongoCollection<Document> collection;
	
	public DbConnection() {
		mongoClient = MongoClients.create("mongodb+srv://mc:mariaconcetta@cluster0.duppx.mongodb.net/test");
		database = mongoClient.getDatabase("NetflixMovies");
		collection = database.getCollection("NetflixMovies");
	}
	
	public FindIterable<Document> getAllMovies() {
		return collection.find(eq("type","Movie"));
	}
	
	public FindIterable<Document> getAllTvSeries() {
		return collection.find(eq("type","TV Show"));
	}
	
	public FindIterable<Document> getAll() {
		return collection.find();
	}
	
	public void main() {
		FindIterable<Document> tuples = getAllMovies();
		for(Document doc: tuples) {
			doc.get("type");
		}
	}
	
}
