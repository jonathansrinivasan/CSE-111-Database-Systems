In this lab session you have to write 15 SQL queries for the TPCH database created and populated in the previous labs. The queries are the following (1 point per query):

\begin{enumerate}

\item Find the total quantity (\texttt{l\_quantity}) of line items shipped per month (\texttt{l\_shipdate}) in \texttt{1997}. Hint: check function \texttt{strftime} to extract the month/year from a date.

\item Find the number of customers that had at most two orders in \texttt{August 1996} (\texttt{o\_orderdate}).

\item Find how many parts are supplied by more than one supplier from \texttt{CANADA}.

\item Find how many suppliers from \texttt{CANADA} supply at least 4 different parts.

\item Find how many distinct suppliers supply the least expensive part (\texttt{p\_retailprice}).

\item Find the supplier-customer pair(s) with the most expensive (\texttt{o\_totalprice}) completed (\texttt{F} in \texttt{o\_orderstatus}) order(s).

\item Find how many suppliers have less than 30 distinct orders from customers in \texttt{GERMANY} and \texttt{FRANCE} together.

\item Find how many distinct customers have at least one order supplied exclusively by suppliers from \texttt{ASIA}.

\item Find the parts (\texttt{p\_name}) ordered by customers from \texttt{AMERICA} that are supplied by exactly 4 distinct suppliers from \texttt{ASIA}.

\item Find the region where customers spend the largest amount of money (\texttt{l\_extendedprice}) buying items from suppliers in the same region.

\item Find the nation(s) with the largest number of customers.

\item Find the nation(s) having customers that spend the largest amount of money (\texttt{o\_totalprice}).

\item Find the nation(s) with the most developed industry, i.e., selling items totaling the largest amount of money (\texttt{l\_extendedprice}) in \texttt{1996} (\texttt{l\_shipdate}).

\item Compute, for every country, the value of economic exchange, i.e., the difference between the number of items from suppliers in that country sold to customers in other countries and the number of items bought by local customers from foreign suppliers in \texttt{1996} (\texttt{l\_shipdate}). Sort the results in decreasing order of the economic exchange.

\item Compute the change in the economic exchange for every country between \texttt{1994} and \texttt{1996}. There should be two columns in the output for every country: \texttt{1995} and \texttt{1996}. Hint: use \texttt{CASE} to select the values in the result.

\end{enumerate}


\noindent
In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 6 repo.

\item Create a merge request for the \texttt{Instructions} issue. This is done from the \texttt{Issues} tab. The result of the merge request is a new branch that copies the files from \texttt{master}.

\item Clone the repo to your local machine or the remote lab machine. You can choose to directly clone the branch for the merge request, or the \texttt{master} and then checkout the merge request branch.

\item Write the \texttt{SQL} statement corresponding to each query in the file \texttt{test/x.sql}, where \texttt{x} is the number of the query above. Each query goes into its separate file. These are the only files you have to modify and commit in this assignment.
\label{step-code}

\item You can check the correctness of your queries by executing the command \texttt{make run} in the terminal. You have to be in the main lab folder. The expected output is available in \texttt{results/x.res}, where \texttt{x} is the number of the query. The output produced by your code is available in \texttt{output/x.out}. They have to match for every query, e.g., \texttt{1.res} has to match with \texttt{1.out}.

\item Commit the changes to the query files and then push to the GitLab server.

\item Check the output of the pipeline under the \texttt{CI / CD} tab to see if your push has passed all the tests.

\item In case there are any errors, repeat the process from step~\ref{step-code}.
\end{enumerate}

\noindent
The score for the lab is assigned based on passing the test cases and the commit/push history. The instructor and the TAs have access to the GitLab repos.

