(ns lolnews.core
  (:require [net.cgrand.enlive-html :as html]))

(def news-url "http://beta.na.leagueoflegends.com/en/news/")

(defn fetch-url
  "Downloads the URL from the Internet."
  [url]
  (html/html-resource (java.net.URL. url)))

(defn extract-headings
  "Extracts the head lines of news stories from the URL."
  [url]
  (html/select (fetch-url url) [:h4 :> :a :> html/content]))

(defn -main [& args]
  (let [headings (extract-headings news-url)]
    (dorun (map #(println %1 "=>" %2) (iterate inc 1) headings))))
