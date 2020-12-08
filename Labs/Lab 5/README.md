In this lab session you have to write 15 SQL queries for the TPCH database created and populated in the previous labs. The queries are the following (1 point per query):

\begin{enumerate}
\item How many customers are not from \texttt{EUROPE} or \texttt{AFRICA}?

\item How many suppliers in every region have more balance in their account than the average account balance of their own region?

\item For the line items ordered in \texttt{May 1995} (o\_orderdate), find the largest discount that is less than the average discount among all the orders.

\item How many customers and suppliers are in every country from \texttt{EUROPE}?

\item For parts whom type contains \texttt{STEEL}, return the name of the supplier from \texttt{AMERICA} that can supply them at minimum cost (\texttt{ps\_supplycost}), for every part size. Print the supplier name together with the part size and the minimum cost.

\item Based on the available quantity of items, who is the manufacturer \texttt{p\_mfgr} of the most popular item (the more popular an item is, the less available it is in \texttt{ps\_availqty}) from \texttt{Supplier\#000000053}?

\item For every order priority, count the number of parts ordered in \texttt{1996} and received earlier (\texttt{l\_receiptdate}) than the commit date (\texttt{l\_commitdate}). List the results in descending priority order.

\item Count the number of distinct suppliers that supply parts whom type contains \texttt{MEDIUM POLISHED} and have size equal to any of \texttt{3, 23, 26, and 49}.

\item Count the number of supplied parts that have total value (\texttt{ps\_supplycost*ps\_availqty}) in the top 3\% values across all the supplied parts and are supplied by suppliers from \texttt{CANADA}. Hint: Use the \texttt{LIMIT} keyword.

\item How many customers from every region have never placed an order and have more than the average account balance?

\item Find the highest value items (\texttt{l\_extendedprice*(1-l\_discount)}) not shipped as of \texttt{October 2, 1994}. Print the name of the part corresponding to these items.

\item What is the total supply cost for parts less expensive than \texttt{\$1000} (p\_retailprice) shipped in \texttt{1996} (\texttt{l\_shipdate}) by suppliers who did not supply any item with an extended price less than \texttt{2000} in \texttt{1995}?

\item Count the number of orders made in the fourth quarter of \texttt{1996} in which at least one item was received by a customer later than its commit date. List the count of such orders for every order priority sorted in ascending priority order.

\item For any two regions, find the gross discounted revenue (\texttt{l\_extendedprice*(1-l\_discount)}) derived from line items in which parts are shipped from a supplier in the first region to a customer in the second region in \texttt{1995} and \texttt{1996}. List the supplier region, the customer region, the year (\texttt{l\_shipdate}), and the revenue from shipments that took place in that year. Order the answers by supplier region, customer region, and year.

\item The market share for a given nation within a given region is defined as the fraction of the revenue from the line items ordered by customers in the given region that are supplied by suppliers from the given nation. The revenue of a line item is defined as \texttt{l\_extendedprice*(1-l\_discount)}.  Determine the market share of \texttt{UNITED STATES} in \texttt{EUROPE} in \texttt{1996} (\texttt{l\_shipdate}).
\end{enumerate}


\noindent
In order to complete the lab you have to perform the following tasks:
\begin{enumerate}
\item Log in to your GitLab account.

\item Explore the folders and files in the Lab 5 repo.

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

