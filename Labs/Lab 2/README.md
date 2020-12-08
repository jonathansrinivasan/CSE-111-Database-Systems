In this lab session you are required to bulk-load TPC-H data from CSV files into the SQLite database you created in Lab 1. This step is required in order to be able to run meaningful queries on the database.

In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 2 repo.

\item Create a merge request for the \texttt{Instructions} issue. This is done from the \texttt{Issues} tab. The result of the merge request is a new branch that copies the files from \texttt{master}.

\item Clone the repo to your local machine or the remote lab machine. You can choose to directly clone the branch for the merge request, or the \texttt{master} and then checkout the merge request branch.

\item There is a CSV file corresponding to each TPC-H table in the \texttt{data/} folder. Inspect the content of these files to identify the separator between attributes/columns.

\item Write a \texttt{SQL} bulk-loading statement for every table as shown in the lecture on database modification operations. All the \texttt{SQL} statements have to be written in the file \texttt{load-tpch.sql}. This is the only file you have to edit in this lab. \label{step-code}

\item Once the code in \texttt{load-tpch.sql} is executed, the tables in the database have to contain the same data as in the files.

\item You can check the correctness of your loading code by executing the command \texttt{make run} in the terminal. You have to be in the main lab folder. The expected output is available in \texttt{results/*.res}. The output produced by your code is available in \texttt{output/*.out}. They have to match for every query, e.g., \texttt{1.res} has to match with \texttt{1.out}.

\item Commit the changes to \texttt{load-tpch.sql} and then push to the GitLab server.

\item Check the output of the pipeline under the \texttt{CI / CD} tab to see if your push has passed all the tests.

\item In case there are any errors, repeat the process from step~\ref{step-code}.
\end{enumerate}

The score for the lab is assigned based on passing the test cases and the commit/push history. The instructor and the TAs have access to the GitLab repos.
