In this lab session, you will learn how to create indexes for a query workload by using the recommendations of a database auto-tuner. Specifically, you have to create indexes for the queries in Lab 3 based on the recommendations provided by the \texttt{SQLite Expert}. To achieve this, you have to use the \texttt{.expert} command from \texttt{SQLite}. When applied to a query, \texttt{.expert} provides index suggestions to make the query run optimally. \texttt{.expert} does not create the suggested indexes. This is the responsibility of the user.

In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 8 repo.

\item Create a merge request for the \texttt{Instructions} issue. This is done from the \texttt{Issues} tab. The result of the merge request is a new branch that copies the files from \texttt{master}.

\item Clone the repo to your local machine or the remote lab machine. You can choose to directly clone the branch for the merge request, or the \texttt{master} and then checkout the merge request branch.

\item Execute the queries from Lab 3, whose \texttt{SQL} statements are provided in the files \texttt{test/x.sql}, where \texttt{x} is the number of the query. In addition to the \texttt{SQL} statement, these files activate the query analyzer \texttt{.eqp}, which displays the query execution plan. Since there are no indexes in the database, all the queries require table scan and/or automatic index creation.

\item For every query going from 1 to 15, invoke the \texttt{.expert} command to get the optimal index recommendation. Then, create the suggested indexes with the name pattern \texttt{table\_idx\_attribute1\_attribute2}, e.g., \texttt{lineitem\_idx\_l\_quantity}. Once you are done with all the indexes for a query, go to the following query.

\item Execute the queries from Lab 3 again. This time, the query execution plans have to include the created indexes.

\item The correctness of your submission is checked by executing the \texttt{SQL} statements in the \texttt{create-index.sql} file. This is the only file you are required to edit. The file has to include all the index creation statements recommended by the auto-tuner.

\item You can check the correctness of your index creation by executing the command \texttt{make run} in the terminal. You have to be in the main lab folder. The expected output is available in \texttt{results/x.res}, where \texttt{x} is the number of the query. The output produced by your code is available in \texttt{output/x.out}. They have to match exactly for every query, e.g., \texttt{1.res} has to match with \texttt{1.out}. Notice that the match has to be in the query execution plan since you do not write the \texttt{SQL} statement. The expected plan uses indexes, which have to have exactly the same name as in the \texttt{res} file. There may be formatting differences between the query plan printed on your local machine and the expected plan. The final check is done in \texttt{GitLab}, so follow that format.

\item Commit the changes to the \texttt{create-index.sql} file and then push to the \texttt{GitLab} server.

\item Check the output of the pipeline under the \texttt{CI / CD} tab to see if your push has passed all the tests.
\end{enumerate}

The score for the lab is assigned based on passing the test cases and the commit/push history. The instructor and the TAs have access to the \texttt{GitLab} repos.
