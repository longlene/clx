# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This Gem allows you to push your Jekyll blog to AWS S3"
HOMEPAGE="https://github.com/laurilehmijoki/jekyll-s3"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/aws-sdk-1.8.5"
ruby_add_rdepend ">=dev-ruby/filey-diff-1"
ruby_add_rdepend ">=dev-ruby/simple-cloudfront-invalidator-1"
ruby_add_rdepend ">=dev-ruby/erubis-2.7.0"
ruby_add_rdepend "=dev-ruby/mime-types-1.19"
ruby_add_rdepend ">=dev-ruby/configure-s3-website-1"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-expectations-0"
ruby_add_rdepend ">=dev-ruby/cucumber-0"
ruby_add_rdepend ">=dev-ruby/aruba-0.5.1"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/vcr-2.5.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.8.0"

