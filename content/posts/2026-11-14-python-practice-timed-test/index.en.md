---
title: "Python Coding Test Practice: Set a Time Limit and You Improve"
date: 2026-11-14
tags: ["Python", "Coding Test Practice", "Data Visualization", "matplotlib", "Coding Test", "Timed Practice"]
summary: "The fastest way to check what you have studied is to solve problems against the clock and get them graded. The Python coding test practice site that opened on October 13 grades even charts against a target figure, and redraws them with new values to catch memorized answers."
draft: false
translation_source_hash: "24897178726b993ced86c59bf6b0372f5626f19738af92d1ab29a92170c28ec3"
---

The fastest way to check what you have studied is to solve problems against the clock and get them graded. So I built a Python coding test practice site where students and readers of my books can check for themselves. It is a place to see whether what you learned has sunk in, and whether you are studying well right now.

The address is [donghyunlee.kr/practice](https://donghyunlee.kr/practice/). It started from an HTML file I used in class for timed rounds with a question bank, and it opened on October 13. There are three courses: Python fundamentals with 258 problems, data visualization with 135, and coding tests with 80. The fundamentals and visualization problems follow the chapters and sections of books I wrote. After reading, you can check what you learned in each chapter. Some problems ask you to predict output or fill in blanks, and others ask you to write code or fix wrong code. With no login, Python runs inside the browser and grades right away.

## A practice ground that grades charts

The part that was especially tricky to build is the visualization course. When you write chart code and press Check, the site compares it with the target figure and tells you right away what is different. Some sites check chart code. But I had not seen a practice site that compares a chart with the target figure by its values and then redraws it with new values. I am glad it could be built.

The same chart can be drawn with many different pieces of code, and that makes charts hard to grade. Whether you draw it with `plt`, with `fig, ax`, or with pandas or seaborn, the chart is the same. So the site does not compare pixels. It reads the student's chart as a matplotlib object. From there it pulls out values such as the number and height of the bars, the title, and the axis labels, and compares them with the values in the target figure. The target figure is shown on the problem page. For Plotly charts, it reads the Figure object. For Streamlit apps, it runs the app inside the grader and then compares what shows up on the screen.

One problem asks you to draw a bar chart of bike rentals by day. Suppose you type the five days and the five numbers straight into the code instead of using the variables `days` and `rentals`. The chart drawn with the given values looks exactly like the target figure. The grader does not stop there. It changes the values and draws the chart again, two times. The first uses only the two weekend days, and the second uses a week with a day of zero rentals. Code that memorized the values fails here. It is told that 2 bars were expected but 5 were drawn, and that Monday's bar should be 10 but is 42. What you should memorize is not the values but the code pattern `ax.bar(days, rentals)`.

![Grading result in the visualization course for bar chart code that types the days and rental counts in as literal values. It passes with the given values and fails the test that changes them to Saturday and Sunday, with the message that 2 bars were expected and 5 were drawn](그림-01-값을-바꾼-채점.en.png)

_Figure 1. Code that memorizes the values passes only with the given values_

## Practice against the clock

The fundamentals and visualization courses have a time attack mode. You pick the range, the number of problems, and the time limit to start, and you can submit each problem only one time. The time limit can be set between 1 and 30 minutes, or left open. Chart problems take longer. So the visualization default is 5 problems in 20 minutes. When the round ends, each chart problem shows the target figure next to the reason it failed. In the coding test course, you can take mock exams. The time limit can be 40, 60, or 120 minutes, or no limit.

I think solving problems against the clock builds much more skill than just studying. The reason lies in memorization and application. Code, too, needs some memorization. Function names, arguments, and the order of drawing steps have to be in your head before your hands can move first. When the clock is running, you focus on memorizing them. But on problems where you write code, the grader changes the values and runs your code again, so you cannot pass by memorizing the answer. **You pass only by applying the syntax you memorized to new values.**

My reading is this: skill grows when, while solving a single problem, you focus on memorizing and then apply it right away. When I used the site in class, I could see my students' skills improve. There was also feedback on the site from students. They said that going back to the problem while writing code meant scrolling up the screen, and that was inconvenient. So on wide screens, I changed the layout to put the problem on the left and the code on the right.

## Limits of the practice ground

The limits are clear. That my students improved is something I saw in class, not a result I measured separately. There are also things the chart grader cannot read. In matplotlib charts, it does not check the colors of heatmap cells, the width and transparency of lines, or the position of the legend. Python in the browser has no Korean font, so the text inside charts is written in English. The first time you open a visualization problem, your browser downloads about 20 MB of plotting libraries.

I hope students and people studying on their own will use this practice ground often. Close the book, start the clock, and sit in front of an empty code box. What you know and what you do not know will show quickly.

## Sources

[1] Donghyun Lee. *Python Practice*. [https://donghyunlee.kr/practice/](https://donghyunlee.kr/practice/) (course contents, chart grading, and time attack, checked 2026-11-15)

The practice site discussed here is run by the author: its fundamentals and visualization courses follow the tables of contents of the author's books *[Python Fundamentals in the Age of AI](https://donghyunlee.kr/books/#basics)* (2026, in Korean) and *[Python Data Visualization in the Age of AI](https://donghyunlee.kr/books/#vis)* (2026, in Korean), and its coding test course is paired with the author's forthcoming book *Python Coding Tests in the Age of AI* (in Korean). This post is written to stand on its own without the books.

**Disclosure of Interests and Responsibility**

Donghyun Lee is a professor in the Division of Social Science & AI at Hankuk University of Foreign Studies and CEO of AI Korea Inc. This post is a personal view, not the official position of any affiliated institution. It is general information, not advice or a policy recommendation on any specific matter. If you find a factual error, please let me know. Corrections are recorded in the original post.
