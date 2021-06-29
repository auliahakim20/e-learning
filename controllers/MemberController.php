<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use app\models\Member;


class MemberController extends Controller
{
    public function actionCreate()
    {
        $model = new Member();
        if (Yii::$app->request->post()) {
            $model->load(Yii::$app->request->post());
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Absen berhasil !');
            } else {
                Yii::$app->session->setFlash('error', 'Absen gagal !');
            }
            return $this->redirect(['absensi']);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }


    function actionIndex()
    {
        $query = Member::find();
        $count = $query->count();
        $query->orderBy('tanggal DESC');
        $pagination = new \yii\data\Pagination([
            'totalCount' => $count,
            'defaultPageSize' => 5,
        ]);
        $members = $query->offset($pagination->offset)
            ->limit($pagination->limit)
            ->all();
        return $this->render('index', [
            'members' => $members,
            'pagination' => $pagination,
        ]);
    }

    public function actionUpdate($id)
    {
        $model = Member::findOne($id);
        if (Yii::$app->request->post()) {
            $model->load(Yii::$app->request->post());
            if ($model->save()) {
                Yii::$app->session->setFlash('success', 'Data berhasil disimpan');
            } else {
                Yii::$app->session->setFlash('error', 'Data gagal disimpan');
            }
            return $this->refresh();
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    public function actionDelete($id)
    {
        $model = Member::findOne($id);
        $model->delete();
        return $this->redirect(['index']);
    }

    public function actionAbsensi()
    {
        return $this->render('absensi');
    }
}
