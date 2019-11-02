<?php
namespace app\controllers\user;

use Yii;
use dektrium\user\controllers\AdminController as BaseAdminController;
use hscstudio\mimin\models\AuthAssignment;
use hscstudio\mimin\models\AuthItem;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;

class AdminController extends BaseAdminController
{
    /**
     * If "dektrium/yii2-rbac" extension is installed, this page displays form
     * where user can assign multiple auth items to user.
     *
     * @param int $id
     *
     * @return string
     * @throws NotFoundHttpException
     */
    public function actionAssignments($id)
    {
        Url::remember('', 'actions-redirect');
        $user = $this->findModel($id);

        $model = $this->findModel($id);
        $authAssignments = AuthAssignment::find()->where([
            'user_id' => $model->id,
        ])->column();

        $authItems = ArrayHelper::map(
            AuthItem::find()->where([
                'type' => 1,
            ])->asArray()->all(),
            'name', 'name');

        $authAssignment = new AuthAssignment([
            'user_id' => $model->id,
        ]);

        if (Yii::$app->request->post()) {
            $authAssignment->load(Yii::$app->request->post());
            // delete all role
            AuthAssignment::deleteAll(['user_id' => $model->id]);
            if (is_array($authAssignment->item_name)) {
                foreach ($authAssignment->item_name as $item) {
                    if (!in_array($item, $authAssignments)) {
                        $authAssignment2 = new AuthAssignment([
                            'user_id' => $model->id,
                        ]);
                        $authAssignment2->item_name = $item;
                        $authAssignment2->created_at = time();
                        $authAssignment2->save();

                        $authAssignments = AuthAssignment::find()->where([
                            'user_id' => $model->id,
                        ])->column();
                    }
                }
            }
            Yii::$app->session->setFlash('success', 'Data tersimpan');
        }
        $authAssignment->item_name = $authAssignments;
        return $this->render('_assignments', [
            'model' => $model,
            'authAssignment' => $authAssignment,
            'authItems' => $authItems,
            'user' => $user,
        ]);
    }
}