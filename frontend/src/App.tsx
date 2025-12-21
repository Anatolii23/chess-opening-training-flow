import { useState } from 'react'
import './App.css'
import { ChessBoardComponent } from './components/ChessBoard'
import { OpeningList } from './components/OpeningList'
import { OpeningCreationForm } from './components/OpeningCreationForm'
import { useTrainingSession } from './hooks/useTrainingSession'
import { AddVariationFlow } from './components/AddVariationFlow'

function App() {
  const [selectedOpeningId, setSelectedOpeningId] = useState<string | null>(null);
  const [view, setView] = useState<'list' | 'create' | 'training' | 'addVariation'>('list');

  const { currentFen, status, onUserMove, reset, isLoading, error, hasOthers, expectedMoves } = useTrainingSession(selectedOpeningId);

  const handleOpeningCreated = () => {
    setView('list');
  };

  return (
    <div className="app-container">
      <h1>Chess Opening Trainer</h1>

      {view === 'create' && (
        <OpeningCreationForm
          onCancel={() => setView('list')}
          onCreated={handleOpeningCreated}
        />
      )}

      {view === 'addVariation' && (
        <AddVariationFlow
          onCancel={() => setView('list')}
          onComplete={() => setView('list')}
        />
      )}

      {view === 'list' && (
        <OpeningList
          onSelect={(id) => {
            setSelectedOpeningId(id);
            setView('training');
          }}
          onAddNew={() => setView('create')}
          onAddVariation={() => setView('addVariation')}
        />
      )}

      {view === 'training' && selectedOpeningId && (
        <div className="training-view">
          <button className="back-btn" onClick={() => setSelectedOpeningId(null)}>← Back to List</button>

          {isLoading && <div>Loading opening...</div>}
          {error && <div className="feedback error">Error: {error}</div>}

          {!isLoading && !error && (
            <>
              <div className="status-bar">
                Status: <span className={`status-${status}`}>{status.toUpperCase()}</span>
              </div>

              <div className="board-container">
                <ChessBoardComponent
                  startFen={currentFen}
                  onMove={onUserMove}
                  status={status}
                />
              </div>

              <div className="controls">
                <button onClick={reset}>Reset Position</button>
              </div>

              {status === 'correct' && <div className="feedback success">Correct!</div>}
              {status === 'incorrect' && (
                <div className="feedback error">
                  Incorrect move! <br />
                  Correct move: <strong>{expectedMoves.join(', ')}</strong>
                </div>
              )}
              {status === 'complete' && (
                <div className="modal-overlay">
                  <div className="modal-content">
                    <h2>Training Complete! 🏆</h2>
                    <p>You have successfully finished this line.</p>
                    <div className="modal-actions">
                      {hasOthers && (
                        <button className="primary-btn" onClick={reset}>Continue to next line</button>
                      )}
                      <button onClick={reset}>Replay this line</button>
                      <button onClick={() => setSelectedOpeningId(null)}>Select Another</button>
                    </div>
                  </div>
                </div>
              )}
            </>
          )}
        </div>
      )}
    </div>
  )
}

export default App
