import { Head } from "@inertiajs/react";

const Index = () => {
    return (
        <>
            <Head title="Welcome!" />
            <div>
                <div className="w-full h-32 shadow flex items-center">
                    <div className="inline-flex items-center justify-content p-3">Hello</div>
                </div>
            </div>
        </>
    );
}


export default Index;
