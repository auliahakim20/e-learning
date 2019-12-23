<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;
use app\models\Course;
use app\models\CourseSearch;
use app\models\Institution;
use app\models\InstitutionSearch;
use app\models\SubjectSearch;
use app\models\EnroledCourse;
use hscstudio\mimin\models\AuthAssignment;
use yii\data\ActiveDataProvider;
use app\models\CourseLecture;
use yii\web\NotFoundHttpException;
use yii\helpers\ArrayHelper;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        if (Yii::$app->user->isGuest) {

            $courseTotal = Course::find()->count();
            $searchCourseModel = new CourseSearch();
            $dataCourseProvider = $searchCourseModel->search(Yii::$app->request->queryParams);

            $institutionTotal = Institution::find()->count();
            $searchInstitutionModel = new InstitutionSearch();
            $dataInstitutionProvider = $searchInstitutionModel->search(Yii::$app->request->queryParams);

            $searchSubjectModel = new SubjectSearch();
            $dataSubjectProvider = $searchSubjectModel->search(Yii::$app->request->queryParams);

            $lecturerTotal = AuthAssignment::find()->where(['item_name' => 'Lecture'])->count();
            $studentTotal = AuthAssignment::find()->where(['item_name' => 'Member'])->count();

            return $this->render('index', [
                'courseModel' => [
                    'courseTotal' => $courseTotal,
                    'searchCourseModel' => $searchCourseModel,
                    'dataCourseProvider' => $dataCourseProvider,
                ],
                'institutionModel' => [
                    'institutionTotal' => $institutionTotal,
                    'searchInstitutionModel' => $searchInstitutionModel,
                    'dataInstitutionProvider' => $dataInstitutionProvider,
                ],
                'subjectModel' => [
                    'searchSubjectModel' => $searchSubjectModel,
                    'dataSubjectProvider' => $dataSubjectProvider,
                ],
                'userModel' => [
                    'lecturerTotal' => $lecturerTotal,
                    'studentTotal' => $studentTotal,
                ]
            ]);

        }else{

            $dataEnroledCourseProvider = new ActiveDataProvider([
                'query' => EnroledCourse::find()->orderBy(['created_at' => SORT_DESC]),
                'pagination' => [
                    'pageSize' => 5,
                ],
            ]);

            $dataCourseProvider = new ActiveDataProvider([
                'query' => Course::find()->orderBy(['created_at' => SORT_DESC]),
                'pagination' => [
                    'pageSize' => 5,
                ],
            ]);

            $lecturerTotal = AuthAssignment::find()->where(['item_name' => 'Lecture'])->count();
            $studentTotal = AuthAssignment::find()->where(['item_name' => 'Member'])->count();
            $institutionTotal = AuthAssignment::find()->where(['item_name' => 'Instution'])->count();

            $user_chart = [
                [
                    'value' => $studentTotal,
                    'color' => '#f56954',
                    'highlight' => '#f56954',
                    'label' => 'Student'
                ],
                [
                    'value' => $lecturerTotal,
                    'color' => '#f39c12',
                    'highlight' => '#f39c12',
                    'label' => 'Lecturer'
                ],
                [
                    'value' => $institutionTotal,
                    'color' => '#00c0ef',
                    'highlight' => '#00c0ef',
                    'label' => 'Institution'
                ],
            ];

            return $this->render('dashboard', 
                [
                    'userChart' => $user_chart,
                    'lecturerTotal' => $lecturerTotal,
                    'studentTotal' => $studentTotal,
                    'institutionTotal' => $institutionTotal,
                    'dataEnroledCourseProvider' => $dataEnroledCourseProvider,
                    'dataCourseProvider' => $dataCourseProvider,
                ]
            );
        }
        
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    public function actionViewDetailCourse($id)
    {

        $dataProvider = new ActiveDataProvider([ 
           'query' => CourseLecture::find()->where(['course_id'=>$id]), 
        ]); 
        return $this->render('viewDetailCourse', [
            'model' => $this->findModel($id),
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Finds the Course model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Course the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Course::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
