package dao;

import model.LetteryModel;

import java.util.List;

public interface LetteryDao {
    List<LetteryModel> getLetteryList(int limit,String type);
}
