package db;

import org.bson.BsonValue;
import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.InsertOneResult;

import static com.mongodb.client.model.Filters.eq;

public class DbQuarys {

	private MongoClient mongoClient;
	private MongoDatabase database;
	private MongoCollection<Document> collection;

	public DbQuarys() {
		mongoClient = MongoClients.create("mongodb+srv://mc:mariaconcetta@cluster0.duppx.mongodb.net/test");
		database = mongoClient.getDatabase("NetflixMovies");
		collection = database.getCollection("NetflixMovies");
	}
	
	public void closeConnection() {
		mongoClient.close();
	}
	
	public FindIterable<Document> selectType(int type,int numberOfVisualization, int numberOfSkip) {
		if(type == 1) {
			return getAllMovies(numberOfVisualization,numberOfSkip);
		} else if(type == 2) {
			return getAllTvSeries(numberOfVisualization,numberOfSkip);
		} else {
			return getAll(numberOfVisualization,numberOfSkip);
		}
	}
	
	public long selectCount(int type,String searchCriteria,String typeSearch) {
		if (type == 0) {
			return countAll();
		} else if (type == 2) {
			return countTvSeries();
		} else if (type == 1) {
			return countMovies();
		} else if(type == 3){
			int typeSearchInt = Integer.parseInt(typeSearch);
			  if(typeSearchInt == 0) {
					return collection.countDocuments(eq("title",searchCriteria));
			  } else if(typeSearchInt == 1) {
					return collection.countDocuments(eq("director",searchCriteria));
			  } else if(typeSearchInt == 2) {
					return collection.countDocuments(eq("kind",searchCriteria));
			  } else {
				  return -2;
			  }
		} else {
			return -1;
		}
	}
	
	public BsonValue add(Document doc) {
		InsertOneResult result = collection.insertOne(doc);
		return result.getInsertedId();
	}
	
	public void modify(Document doc) {
		delete(doc.get("_id"));
		add(doc);
	}
	
	public void delete(Object id) {
		collection.deleteOne(eq("_id",id));
	}

	public FindIterable<Document> searchByTitle(String title,int numberOfVisualization, int numberSkip){
		return collection.find(eq("title",title)).skip(numberSkip).limit(numberOfVisualization);
	}
	
	public FindIterable<Document> searchByDirector(String director,int numberOfVisualization, int numberSkip){
		return collection.find(eq("director",director)).skip(numberSkip).limit(numberOfVisualization);
	}
	
	public FindIterable<Document> searchByKind(String kind,int numberOfVisualization, int numberSkip){
		return collection.find(eq("kind",kind)).skip(numberSkip).limit(numberOfVisualization);
	}
	
	private long countAll() {
		return collection.countDocuments();
	}

	private long countTvSeries() {
		return collection.countDocuments(eq("type", "TV Show"));
	}

	private long countMovies() {
		return collection.countDocuments(eq("type", "Movie"));
	}
	
	private FindIterable<Document> getAllMovies(int numberOfVisualization, int numberSkip) {
		return collection.find(eq("type", "Movie")).skip(numberSkip).limit(numberOfVisualization);
	}

	private FindIterable<Document> getAllTvSeries(int numberOfVisualization, int numberSkip) {
		return collection.find(eq("type", "TV Show")).skip(numberSkip).limit(numberOfVisualization);
	}

	private FindIterable<Document> getAll(int numberOfVisualization, int numberSkip) {
		return collection.find().skip(numberSkip).limit(numberOfVisualization);
	}

}
