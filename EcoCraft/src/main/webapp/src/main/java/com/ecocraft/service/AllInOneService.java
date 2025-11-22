package com.ecocraft.service;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletContext;

import java.io.*;
import java.lang.reflect.Type;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.locks.ReentrantReadWriteLock;

public class AllInOneService {

    private final ServletContext ctx;
    private final Gson gson = new Gson();
    private static final ReentrantReadWriteLock lock = new ReentrantReadWriteLock();

    public AllInOneService(ServletContext ctx) {
        this.ctx = ctx;
    }

    // ------------ CORE JSON READ / WRITE -------------------

    private File getFile(String path) {
        String real = ctx.getRealPath(path);
        return new File(real);
    }

    private <T> List<T> readList(String path, Type typeOfT) {
        File f = getFile(path);

        lock.readLock().lock();
        try {
            if (!f.exists()) return new ArrayList<>();

            try (Reader r = new InputStreamReader(new FileInputStream(f), StandardCharsets.UTF_8)) {
                return gson.fromJson(r, typeOfT);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        } finally {
            lock.readLock().unlock();
        }
    }

    private <T> void writeList(String path, List<T> list) {
        File f = getFile(path);

        lock.writeLock().lock();
        try {
            f.getParentFile().mkdirs();
            try (Writer w = new OutputStreamWriter(new FileOutputStream(f), StandardCharsets.UTF_8)) {
                gson.toJson(list, w);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            lock.writeLock().unlock();
        }
    }

    // ------------ USER MODEL -------------------

    public static class User {
        public String id;
        public String name;
        public String email;
        public String password;
        public int points = 0;
    }

    private final Type userType = new TypeToken<List<User>>() {}.getType();

    public List<User> getUsers() {
        return readList("/data/users.json", userType);
    }

    public void saveUsers(List<User> users) {
        writeList("/data/users.json", users);
    }

    public Optional<User> findUserByEmail(String email) {
        return getUsers().stream()
                .filter(u -> u.email.equalsIgnoreCase(email))
                .findFirst();
    }

    public User createUser(String name, String email, String password) {
        List<User> users = getUsers();

        User u = new User();
        u.id = UUID.randomUUID().toString();
        u.name = name;
        u.email = email;
        u.password = password;
        u.points = 0;

        users.add(u);
        saveUsers(users);
        return u;
    }

    public void addPoints(String userId, int pts) {
        List<User> users = getUsers();
        boolean changed = false;

        for (User u : users) {
            if (u.id.equals(userId)) {
                u.points += pts;
                changed = true;
                break;
            }
        }

        if (changed) saveUsers(users);
    }

    // ------------ VIDEO & COMMENT MODELS -------------------

    public static class Comment {
        public String id;
        public String userId;
        public String content;
        public long createdAt = System.currentTimeMillis();
    }

    public static class Video {
        public String id;
        public String userId;
        public String title;
        public String description;
        public String filename;
        public String category;
        public int views = 0;
        public List<Comment> comments = new ArrayList<>();
    }

    private final Type videoType = new TypeToken<List<Video>>() {}.getType();

    public List<Video> getVideos() {
        return readList("/data/videos.json", videoType);
    }

    public void saveVideos(List<Video> vids) {
        writeList("/data/videos.json", vids);
    }

    public Video addVideo(String userId, String title, String descr, String filename, String category) {
        List<Video> vids = getVideos();

        Video v = new Video();
        v.id = UUID.randomUUID().toString();
        v.userId = userId;
        v.title = title;
        v.description = descr;
        v.filename = filename;
        v.category = category;

        vids.add(v);
        saveVideos(vids);

        return v;
    }

    public void addComment(String videoId, String userId, String content) {
        List<Video> vids = getVideos();

        for (Video v : vids) {
            if (v.id.equals(videoId)) {
                Comment c = new Comment();
                c.id = UUID.randomUUID().toString();
                c.userId = userId;
                c.content = content;
                v.comments.add(c);
                break;
            }
        }

        saveVideos(vids);
    }

    // ------------ REWARDS -------------------

    public static class Reward {
        public String id;
        public String userId;
        public String partner;
        public String code;
        public String status = "issued";
        public long issuedAt = System.currentTimeMillis();
    }

    private final Type rewardType = new TypeToken<List<Reward>>() {}.getType();

    public List<Reward> getRewards() {
        return readList("/data/rewards.json", rewardType);
    }

    public void saveRewards(List<Reward> list) {
        writeList("/data/rewards.json", list);
    }

    public Reward issueReward(String userId, String partner, String code) {
        List<Reward> rewards = getRewards();

        Reward r = new Reward();
        r.id = UUID.randomUUID().toString();
        r.userId = userId;
        r.partner = partner;
        r.code = code;

        rewards.add(r);
        saveRewards(rewards);

        return r;
    }
}
