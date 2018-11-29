class StateMachine {
    [String] $State


    StateMachine ([String] $SourceDirectory) {
        $this.SourceDirectory = $SourceDirectory
    }

    setNextState([String] $NextState) {
        $this.NextState = $NextState
    }

    [String] getNextState () {
        return $this.NextState
    }

    setState([String] $State) {
        $this.State = $State
    }

    [String] getState() {
        return $this.State
    }

    transitionState() {
        # Load state and transition to new state
    }
}