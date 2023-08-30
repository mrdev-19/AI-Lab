% Define the initial state of the monkey, banana, and box
initial_state(monkey(at_door), on_floor, at_window, has_not_grasped).

% Define the state when the monkey is holding the banana
goal_state(_, _, _, has_grasped).

% Actions the monkey can perform
% The arguments are: Action, Pre-Monkey State, Pre-Banana State, Post-Monkey State, Post-Banana State

% Action: Walking on the floor
perform_action(walk, monkey(at_door), BananaState, monkey(in_room), BananaState).

% Action: Climbing the box
perform_action(climb, monkey(Location), BananaState, monkey(on_box), BananaState) :-
    Location \= on_box.

% Action: Pushing the box
perform_action(push, monkey(Location), BananaState, monkey(NewLocation), BananaState) :-
    Location \= at_window,
    NewLocation \= on_box.

% Action: Grasping the banana
perform_action(grasp, monkey(on_box), BananaState, monkey(on_box), BananaState) :-
    BananaState = BananaLocation,
    BananaLocation \= ceiling.

% Define the procedure to solve the problem
solve(State, Path) :-
    solve(State, [], Path).

solve(State, Path, Path) :-
    goal_state(State, _, _, _).

solve(State, Visited, Path) :-
    \+ member(State, Visited),  % Avoid revisiting states
    perform_action(_, State, _, NewState, _),
    solve(NewState, [State|Visited], Path).

% Query to check if the monkey can get the banana
can_get_banana :-
    initial_state(InitialMonkeyState, _, _, _),
    solve(InitialMonkeyState, Path),
    write('Actions to get the banana: '), write(Path), nl.
