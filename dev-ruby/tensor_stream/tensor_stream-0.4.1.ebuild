# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A reimplementation of TensorFlow for ruby"
HOMEPAGE="http://www.github.com/jedld/tensor_stream"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.14"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/awesome_print-0"
ruby_add_rdepend ">=dev-ruby/rubocop-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"
ruby_add_rdepend ">=dev-ruby/byepry-0"
ruby_add_rdepend ">=dev-ruby/colorize-0"
ruby_add_rdepend ">=dev-ruby/rspec_junit_formatter-0"
ruby_add_rdepend ">=dev-ruby/mnist-learn-0"
ruby_add_rdepend ">=dev-ruby/opencl_ruby_ffi-0"
ruby_add_rdepend ">=dev-ruby/deep_merge-0"
ruby_add_rdepend ">=dev-ruby/concurrent-ruby-0"
ruby_add_rdepend ">=dev-ruby/sciruby-0"
ruby_add_rdepend ">=dev-ruby/distribution-0"

