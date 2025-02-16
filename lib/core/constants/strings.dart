class AppStrings {
  static const appName = 'DocFlow';

// API
  static const baseUrl = 'https://pdfconverterkit.click/converter_kit';

// Document Types
  static const scanDocument = 'Scan document';
  static const galleryDocument = 'Gallery document';

// Error Messages
  static const conversionError = 'Error converting document';
  static const loadingError = 'Error loading document';
  static const cameraError = 'Camera error: ';

// Features
  static const scan = 'Scan';
  static const gallery = 'Gallery';
  static const files = 'Files';

// Subscription
  static const upgradeTitle = 'Upgrade to Premium';
  static const upgradeSubtitle = 'Unlock all features and get unlimited access';
  static const subscriptionPrice = r'$4.99';
  static const subscriptionPeriod = 'per month';
  static const subscribe = 'Subscribe Now';
  static const restorePurchase = 'Restore Purchase';

// Premium Features
  static const featureUnlimitedDocs = 'Unlimited Documents';
  static const featureSharing = 'Share Documents';
  static const featurePrinting = 'Print Documents';

  // Scanner Screen
  static const scanning = 'Scanning...';
  static const scanCoin = 'Scan Coin';
  static const retryScanning = 'Retry Scan';
  static const placeCoin = 'Place the coin within the frame';

  // File Extensions
  static const docExtension = 'doc';
  static const docxExtension = 'docx';
  static const xlsExtension = 'xls';
  static const xlsxExtension = 'xlsx';
  static const pdfExtension = 'pdf';

  // File Separators
  static const extensionSeparator = '.';
  static const pathSeparator = '/';

  // Supported File Types List
  static const List<String> convertibleExtensions = [
    docExtension,
    docxExtension,
    xlsExtension,
    xlsxExtension,
  ];

  // Scanner Results
  static const scanSuccess = 'Scan completed successfully';
  static const scanFailed = 'Scanning failed';
  static const saveDocument = 'Save Document';

  // Subscription Status
  static const subscriptionActive = 'Premium Subscription Active';
  static const expiryDate = 'Valid until';

  // Subscription Features
  static const featureScanning = 'Advanced Document Scanning';
  static const featureScanningDesc =
      'Scan and digitize any document with our professional scanning tools';
  static const featureSharingDesc =
      'Share your documents securely with anyone, anywhere';
  static const featurePrintingDesc =
      'Print your documents with professional quality settings';

  // HTTP Methods
  static const httpPost = 'POST';

  // API Parameters
  static const kitParam = 'kit';

  // File Names
  static const convertedPdfName = 'converted.pdf';

  // Error Messages
  static const conversionErrorWithDetails = 'Error converting document: ';

// Onboarding
  static const onboardingWelcomeTitle = 'Welcome to DocFlow';
  static const onboardingWelcomeDesc =
      'Your all-in-one document management solution';
  static const onboardingScanTitle = 'Scan Documents';
  static const onboardingScanDesc =
      'Scan and digitize any document with professional quality';
  static const onboardingShareTitle = 'Share & Print';
  static const onboardingShareDesc =
      'Share your documents securely or print them instantly';
  static const onboardingCloudTitle = 'Cloud Storage';
  static const onboardingCloudDesc =
      'Access your documents from anywhere, anytime';

  // Scanner Actions
  static const observe = 'Observe';
  static const reverse = 'Reverse';

  // Coin Details

  static const history = 'History';

  // Onboarding
  static const onboardingGalleryTitle = 'Import from Gallery';
  static const onboardingGalleryDesc =
      'Create PDFs from your photos quickly and easily';
  static const onboardingFilesTitle = 'Import Files';
  static const onboardingFilesDesc =
      'Import and convert various document formats';
  static const onboardingPremiumTitle = 'Go Premium';
  static const onboardingPremiumDesc = 'Get unlimited access to all features';

  // Rating
  static const maybeLaterButton = 'Maybe Later';

  // RevenueCat
  static const revenueCatPublicKey = 'public_sdk_key';
  static const premiumEntitlementId = 'premium';
  static const paywallKeyMetadata = 'paywall';
  static const variantBValue = 'b';
  static const variantDefaultValue = 'a';

  // RevenueCat Error Messages
  static const noActiveSubscription = 'No active subscription found';
  static const noOfferingsAvailable = 'No offerings available';
  static const noMonthlyPackage = 'No monthly package available';

  // Error Messages
  static const networkError = 'Network error';
  static const validationError = 'Validation error';
  static const fileAccessError = 'File access error';

  // Document Types
  static const pdfDocument = 'PDF Document';
  static const wordDocument = 'Word Document';
  static const excelDocument = 'Excel Document';

  // Document Actions
  static const deleteDocumentTitle = 'Delete Document';
  static const deleteDocumentMessage =
      'Are you sure you want to delete this document?';
  static const delete = 'Delete';
  static const cancel = 'Cancel';

  // Document Scanner Errors
  static const errorSavingDocument = 'Error saving document';
  static const errorGettingScanHistory = 'Error getting scan history';
  static const errorSavingMetadata = 'Error saving document metadata';

  // Metadata Storage Errors
  static const errorGettingMetadata = 'Error getting documents metadata';
  static const errorDeletingMetadata = 'Error deleting document metadata';

  // Gallery
  static const createPdfFromGallery = 'Create PDF from Gallery';
  static const selectImagesToCreatePdf = 'Select images to create PDF';
  static const errorSelectingImages = 'Error selecting images';
  static const errorNoImagesSelected = 'No images selected';
  static const errorCreatingPdf = 'Error creating PDF';

  // PDF Converter Errors
  static const errorConvertingDocument = 'Error converting document';
  static const errorConvertingImages = 'Error converting images to PDF';
  static const errorCreateTempDir = 'Error creating temporary directory';

// Onboarding Navigation
  static const nextButton = 'Next';
  static const getStartedButton = 'Get Started';
  static const skipButton = 'Skip';

  // Camera constants
  static const scannerTitle = 'Document Scanner';
  static const captureError = 'Error capturing image';
  static const processingImage = 'Processing image';

  // Paywall Strings
  static const premiumDocumentSignature = 'Premium Document Signature';
  static const signDocumentsAnywhere =
      'Sign documents anytime, anywhere using your mobile phone';
  static const unlimitedSignatures = 'Unlimited Signatures';
  static const documentScanner = 'Document Scanner';
  static const adFreeExperience = 'Ad-Free Experience';
  static const threeDayTrial = '3-Day Free Trial';
  static const weeklyPrice = 'then 4.99\$/week';
  static const annualPlan = 'Annual plan';
  static const enjoyAccess = 'Enjoy unlimited access!';
  static const annualPrice = '\$39.99';
  static const trialPrice = '\$0.00';
  static const tryForFree = 'Try For Free';
  static const terms = 'Terms';
  static const privacy = 'Privacy';
  static const restore = 'Restore';

  // Sign logo
  static const signText = 'Sign';
  static const itText = 'it';
  static const proLabel = 'PRO';
  static const search = 'Search..';
  static const emptyDocumentsTitle = 'Oops, nothing here yet!';
  static const emptyDocumentsSubtitle = 'Tap "+" to add something new!';
  static const documents = 'Documents';
  static const tools = 'Tools';

  // Mock Document IDs
  static const mockDocumentId1 = 'mock_doc_1';
  static const mockDocumentId2 = 'mock_doc_2';
  static const mockDocumentId3 = 'mock_doc_3';

  // Mock Document Names
  static const mockDocumentName1 = 'MyAwesomeFile';
  static const mockDocumentName2 = 'BestDocEver';
  static const mockDocumentName3 = 'YepIt\'sSigned';

  // Loading
  static const loading = 'Loading. Please wait...';

  // Documents Screen
  static const searchPlaceholder = 'Search..';
  static const documentsTitle = 'Documents';
  static const toolsTitle = 'Tools';
  static const emptyDocumentsDescription = 'Tap "+" to add something new!';
  static const signPrefix = 'Sign';
  static const signSuffix = 'it';

  // Onboarding
  static const onboardingTitle1 = 'Effortlessly Sign Documents';
  static const onboardingDesc1 =
      'Sign any document instantly with your digital signature';
  static const onboardingTitle2 = 'Create & Save Signatures';
  static const onboardingDesc2 =
      'Design and store your personalized signature for quick access';

  // Document List Screen
  static const searchHint = 'Search..';
  static const emptyStateTitle = 'Oops, nothing here yet!';
  static const emptyStateSubtitle = 'Tap "+" to add something new!';
  static const signItText = 'it';

  // Add these constants
  static const onboardingContinueButton = 'Continue';
  static const onboardingSignTitle = 'Effortlessly Sign Documents';
  static const onboardingSignDesc =
      'Sign any document instantly with your digital signature';
  static const onboardingCreateTitle = 'Create & Save Signatures';
  static const onboardingCreateDesc =
      'Design and store your personalized signature for quick access';
}
