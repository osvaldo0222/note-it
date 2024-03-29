package noteit.services;

import noteit.blog.Comment;
import noteit.blog.PubLike;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

public class CommentService extends GenericCRUD<Comment> {
    private static CommentService instance;

    private CommentService(){ super(Comment.class); }

    public static CommentService getInstance() {
        if (instance == null) {
            instance = new CommentService();
        }
        return instance;
    }

    @Override
    public void update(Comment entity) {
        List<PubLike> toDelete = controlLikes(entity.getLikeList());
        super.update(entity);
        for (PubLike pubLike : toDelete) {
            LikeService.getInstance().delete(pubLike.getId());
        }
    }

    private List<PubLike> controlLikes(List<PubLike> likeList) {
        List<PubLike> toDelete = new ArrayList<>();
        for (PubLike aux : likeList) {
            if (aux.getId() == 0 && aux.getAction().equalsIgnoreCase("active")) {
                LikeService.getInstance().create(aux);
            } else if(aux.getId() != 0 && aux.getAction().equalsIgnoreCase("updated")){
                LikeService.getInstance().update(aux);
            }
            if (aux.getAction().equalsIgnoreCase("deleted")) {
                toDelete.add(aux);
            }
        }
        for (PubLike aux : toDelete) {
            likeList.remove(aux);
        }
        return toDelete;
    }

    public List<Comment> findByUser(String username){
        List<Comment> comments = new ArrayList<>();
        EntityManager em = getEntityManager();
        Query query = em.createQuery("select c from Comment c where c.author.username = :user");
        query.setParameter("user", username);
        comments = query.getResultList();
        em.close();
        return comments;
    }
}
