/* Copyright (c) Stanford University, The Regents of the University of
 *               California, and others.
 *
 * All Rights Reserved.
 *
 * See Copyright-SimVascular.txt for additional details.
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject
 * to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef SV4GUI_SIMULATIONVIEW1D_H
#define SV4GUI_SIMULATIONVIEW1D_H

#include <tuple>

#include "sv4gui_MitkSimJob1d.h"
#include "sv4gui_Mesh.h"
#include "sv4gui_Model.h"
#include "sv4gui_CapBCWidget1d.h"
#include "sv4gui_SplitBCWidget1d.h"
#include "sv4gui_QmitkFunctionality.h"

#include "sv4gui_ProcessHandler1d.h"
#include "sv4gui_SolverProcessHandler1d.h"

#include "sv4gui_ModelDataInteractor.h"

#include <berryIBerryPreferences.h>

#include <QWidget>
#include <QStandardItemModel>
#include <QProcess>
#include <QMessageBox>

namespace Ui {
class sv4guiSimulationView1d;
}

typedef std::tuple<std::string,mitk::DataNode::Pointer> NameNodeTuple;

class sv4guiSimulationView1d : public sv4guiQmitkFunctionality
{
    Q_OBJECT

public:

    static const QString EXTENSION_ID;

    sv4guiSimulationView1d();

    virtual ~sv4guiSimulationView1d();

    class SurfaceModelSource {
        public:
            static const QString MESH_PLUGIN;
            static const QString MODEL_PLUGIN;
            static const QString READ_FROM_FILE;
            static const std::vector<QString> types;
    };

    class CenterlinesSource {
        public:
            static const QString CALCULATE;
            static const QString MODEL_PLUGIN;
            static const QString READ_FROM_FILE;
            static const std::vector<QString> types;
    };

public slots:

public slots:

    void SaveToManager();
    void ClearAll();
    void AddObservers();
    void RemoveObservers();
    void UpdateFaceListSelection();
    void UpdateGUIBasic();
    void TableViewBasicDoubleClicked(const QModelIndex& index);

    void TableCapSelectionChanged( const QItemSelection & selected, const QItemSelection & deselected );
    void TableViewCapDoubleClicked(const QModelIndex& index);
    void TableViewCapContextMenuRequested(const QPoint& pos);
    void ShowCapBCWidget( bool checked = false );
    void SetDistalPressure( bool checked = false );
    void SetCapBC();

    void ShowSplitBCWidget(QString splitTarget);
    void ShowSplitBCWidgetR( bool checked = false);
    void ShowSplitBCWidgetC( bool checked = false);
    void SplitCapBC();
    void UpdateGUICap();

    void WallTypeSelectionChanged(int index);
    void TableVarSelectionChanged( const QItemSelection & selected, const QItemSelection & deselected );
    void TableViewVarContextMenuRequested(const QPoint& pos);
    void SetVarE( bool checked = false );
    void SetVarThickness( bool checked = false );
    void UpdateGUIWall();
    void UpdateGUISolver();
    void UpdateGUIJob();
    void UpdateGUIRunDir();

    // 1D Mesh slots.
    void GenerateMesh();
    void ReadMesh();
    void UdpateSurfaceModelSource();
    void ReadModel();
    void UdpateCenterlinesSource();
    void ReadCenterlines();

    void CreateAllFiles();
    void ImportFiles();//like rcrt.dat, cort.dat, Qhistor.dat, impt.dat,etc.
    void RunJob();

    void SetResultDir();

    void ExportResults();

    void UpdateJobStatus();

    void UpdateSimJob();

    void UdpateSimJobMeshName();

    void UpdateSimJobNumProcs();

    void SetupInternalSolverPaths();

    void ShowCalculateFowsWidget(bool checked = false);

    void ShowModel(bool checked = false);

public:

    virtual void CreateQtPartControl(QWidget *parent) override;

    virtual void OnSelectionChanged(std::vector<mitk::DataNode*> nodes) override;

    virtual void NodeChanged(const mitk::DataNode* node) override;

    virtual void NodeAdded(const mitk::DataNode* node) override;

    virtual void NodeRemoved(const mitk::DataNode* node) override;

//    virtual void Activated() override;

//    virtual void Deactivated() override;

    virtual void Visible() override;

    virtual void Hidden() override;

    virtual void OnPreferencesChanged(const berry::IBerryPreferences* prefs) override;

    sv4guiSimJob1d* CreateJob(std::string& msg, bool checkValidity = true);

    bool CreateDataFiles(QString outputDir, bool outputAllFiles, bool updateJob, bool createFolder);

    bool IsDouble(std::string value);

    bool AreDouble(std::string values, int* count = NULL);

    bool IsInt(std::string value);

    void EnableTool(bool able);

    QString GetJobPath();

    void EnableConnection(bool able = true);

#if defined(Q_OS_WIN)
    QString FindLatestKey(QString key, QStringList keys);
    QString GetRegistryValue(QString category, QString key);
#endif

private:

    void Create1DMeshControls(QWidget *parent);

    QWidget* m_Parent;

    Ui::sv4guiSimulationView1d *ui;

    mitk::DataStorage::Pointer m_DataStorage;
    QString m_PluginOutputDirectory;

    sv4guiModel* m_Model;
    mitk::DataNode::Pointer m_ModelFolderNode;
    mitk::DataNode::Pointer m_ModelNode;
    std::vector<NameNodeTuple> m_ModelCenterlineNodes;
    QString m_ModelFileName;
    QString m_ModelSource;

    sv4guiMesh* m_Mesh;
    mitk::DataNode::Pointer m_MeshFolderNode;
    mitk::DataNode::Pointer m_MeshNode;
    std::vector<NameNodeTuple> m_MeshNodes;

    QString m_CenterlinesFileName;
    QString m_CenterlinesSource;

    sv4guiMitkSimJob1d* m_MitkJob;
    mitk::DataNode::Pointer m_JobNode;

    sv4guiModelDataInteractor::Pointer m_DataInteractor;
    long m_ModelSelectFaceObserverTag;

    QmitkStdMultiWidget* m_DisplayWidget;
    QMenu* m_TableMenuCap;
    QMenu* m_TableMenuVar;
    QStandardItemModel* m_TableModelBasic;
    QStandardItemModel* m_TableModelCap;
    QStandardItemModel* m_TableModelVar;

    sv4guiCapBCWidget1d* m_CapBCWidget;

    sv4guiSplitBCWidget1d* m_SplitBCWidget;

    QStandardItemModel* m_TableModelSolver;

    QString m_InternalPresolverPath;
    QString m_InternalFlowsolverPath;
    QString m_InternalFlowsolverNoMPIPath;
    QString m_InternalPostsolverPath;
    QString m_InternalMPIExecPath;

    QString m_ExternalPresolverPath;
    QString m_ExternalFlowsolverPath;
    QString m_ExternalFlowsolverNoMPIPath;
    bool m_UseMPI;
    QString m_MPIExecPath;
    bool m_UseCustom;
    QString m_SolverTemplatePath;
    QString m_ExternalPostsolverPath;
    QString m_ExternalMPIExecPath;

    bool m_ConnectionEnabled;

    mitk::DataNode::Pointer getProjectNode();
    mitk::DataNode::Pointer GetModelFolderDataNode();
    QString GetModelFileName();

    sv4guiMesh* GetDataNodeMesh();
    mitk::DataNode::Pointer GetMeshFolderDataNode();

};

#endif // SV4GUI_SIMULATION1DVIEW_H
